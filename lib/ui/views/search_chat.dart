import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:housemanuser/controller/search_chat/search_chat_cubit.dart';
import 'package:housemanuser/controller/search_chat/search_chat_state.dart';

import 'package:housemanuser/controller/user/user_cubit.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/message_chat.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';
@immutable
class SearchChatView extends StatefulWidget {
  SearchChatView({super.key, required this.customerMail});
 final String? customerMail;
  final TextEditingController searchController = TextEditingController();
  @override
  State<SearchChatView> createState() => _ChatState();
}

class _ChatState extends State<SearchChatView> {
  late WrittenSearchCubit searchCubit;
  late SearchCubit searchCubit2;

  @override
  void initState() {
    super.initState();

    searchCubit = WrittenSearchCubit();
    searchCubit2 = SearchCubit();
    widget.searchController.addListener(onChange);
    searchCubit.getFirestoreDocuments();
    log("**************************************");
    context.read<UserCubit>().fetchAllUsersData();
  }

  void onChange() {
    log(widget.searchController.text);
    searchCubit.searchResultList(widget.searchController.text);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(onChange);
    widget.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(S.of(context).Chat,
            style: TextStyleHelper.textStylefontSize20
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => searchCubit2,
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                widget.searchController.text = state.searchQuery;
                return CustomTextField(
                  textLabel: S.of(context).Searchhere,
                  textController: widget.searchController,
                  textFieldPrefix: const Icon(Icons.search_rounded),
                  textFieldSuffix: IconButton(
                    icon: const Icon(Icons.mic_none_rounded),
                    onPressed: () {
                      context.read<SearchCubit>().startListening();
                    },
                  ),
                  onChangedFunction: (value) {
                    // Update the search query in the cubit
                    context.read<SearchCubit>().updateSearchQuery(value);
                    if (value.isNotEmpty) {
                      // Trigger the search function in the cubit
                      context.read<SearchCubit>().searchForUsers(value);
                    }
                  },
                  validatorFunction: (value) {
                    return null;
                  },
                );
              },
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => searchCubit,
              child: BlocBuilder<WrittenSearchCubit, SearchStatus>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded || state is SearchSuccess) {
                    final user = (state is SearchLoaded)
                        ? state.users
                        : (state as SearchSuccess).users;
                    return ListView.builder(
                      itemCount: user.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Get the current user ID
                            String currentUserId =
                                FirebaseAuth.instance.currentUser!.email!;

                            // Get the peer ID (the user you're chatting with)
                            String peerId = user[index].userMail;

                            // Create the group chat ID
                            String groupChatId;
                            if (currentUserId.hashCode <= peerId.hashCode) {
                              groupChatId = '$currentUserId-$peerId';
                            } else {
                              groupChatId = '$peerId-$currentUserId';
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                  currentUserId: currentUserId,
                                  groupChatId: groupChatId,
                                  peerId: peerId,
                                  recipientId: user[index].userMail,
                                  profileImage: user[index].profileImage ,
                                  // ??
                                  //     "https://louisville.edu/enrollmentmanagement/images/person-icon/image",
                                  recipientName: user[index].userName,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(user[index].profileImage),
                            ),
                            title: Text(user[index].userName),
                            subtitle: Text(user[index].userMail),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
