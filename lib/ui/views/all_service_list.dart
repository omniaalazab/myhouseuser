import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/search/search_cubit.dart';
import 'package:housemanuser/controller/search/search_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/serrvice_list.dart';
import 'package:housemanuser/ui/views/service_details.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';

class AllServiceList extends StatefulWidget {
  const AllServiceList({super.key});

  @override
  State<AllServiceList> createState() => _AllServiceListState();
}

class _AllServiceListState extends State<AllServiceList> {
  TextEditingController searchController = TextEditingController();
  late SearchServiceCubit searchCubit;
  @override
  void initState() {
    super.initState();

    searchCubit = SearchServiceCubit();
    searchController.addListener(onChange);
    searchCubit.getFirestoreDocuments();
    log("**************************************");
  }

  void onChange() {
    log(searchController.text);
    searchCubit.searchResultList(searchController.text, context);
  }

  @override
  void dispose() {
    searchController.removeListener(onChange);
    searchController.dispose();
    super.dispose();
  }

  String searchTerm = '';
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ServiceList,
            style: TextStyleHelper.textStylefontSize19
                .copyWith(color: Colors.white)),
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
      ),
      body: BlocProvider(
        create: (context) => searchCubit,
        child: BlocBuilder<SearchServiceCubit, SearchServiceStatus>(
          builder: (context, state) {
            if (state is SearchServiceLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchServiceLoaded ||
                state is SearchServiceSuccess) {
               (state is SearchServiceLoaded)
                  ? state.serviceModel
                  : (state as SearchServiceSuccess).serviceModel;
              return SearchServicesResult(
                  searchController: searchController,
                  currentLocale: currentLocale);
            } else if (state is SearchServiceFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class SearchServicesResult extends StatelessWidget {
  const SearchServicesResult({
    super.key,
    required this.searchController,
    required this.currentLocale,
  });

  final TextEditingController searchController;
  final Locale currentLocale;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextField(
                textLabel: "Search ...",
                textController: searchController,
                textFieldPrefix: const Icon(Icons.search_rounded),
                textFieldSuffix: const SizedBox(
                  width: 1,
                ),
                validatorFunction: (value) {
                  return null;
                }),
            SizedBox(
              height: 700,
              child: BlocBuilder<SearchServiceCubit, SearchServiceStatus>(
                builder: (context, state) {
                  if (state is SearchServiceLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchServiceLoaded ||
                      state is SearchServiceSuccess) {
                    final services = (state is SearchServiceLoaded)
                        ? state.serviceModel
                        : (state as SearchServiceSuccess).serviceModel;
                    return ListView.builder(
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ServicesList(
                          onTapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ServicesDetails(
                                          index: index,
                                        )));
                          },
                          serviceImagePath: services[index].imagePathService,
                          price: services[index].price,
                          rating: services[index].houseman.rate,
                          serviceName: (currentLocale.languageCode == 'ar')
                              ? services[index].nameServiceAr
                              : services[index].nameServiceEn,
                          housemanName: services[index].houseman.name,
                          housemanImagePath: services[index].houseman.imagePath,
                        );
                      },
                    );
                  } else if (state is SearchServiceFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
