import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/chat/chat_cubit.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  final String groupChatId;
  final String currentUserId;
  final String peerId;
  final String recipientId;
  final String recipientName;
  final String profileImage;

  const ChatScreen(
      {super.key,
      required this.groupChatId,
      required this.recipientName,
      required this.profileImage,
      required this.recipientId,
      required this.currentUserId,
      required this.peerId});

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();

    // Start streaming chat messages
    chatCubit.getChatMessages(groupChatId, 20);

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
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
              radius: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(recipientName,
                style: TextStyleHelper.textStylefontSize20.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, List<ChatMessages>>(
              builder: (context, messages) {
                return buildMessageList(messages, currentUserId);
              },
            ),
          ),
          buildInputArea(chatCubit),
        ],
      ),
    );
  }

  Widget buildInputArea(ChatCubit chatCubit) {
    TextEditingController textController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration:
                  const InputDecoration(hintText: 'Enter your message...'),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: ColorHelper.purple,
            ),
            onPressed: () {
              chatCubit.sendChatMessage(
                textController.text,
                0, // Assuming 0 is the type for text messages
                groupChatId,
                currentUserId,
                peerId,
              );
              textController.clear();
            },
          ),
        ],
      ),
    );
  }
}

Widget buildMessageItem(ChatMessages chatMessage, bool isSender) {
  return Bubble(
    margin: const BubbleEdges.only(top: 10),
    alignment: isSender ? Alignment.topRight : Alignment.topLeft,
    nip: isSender ? BubbleNip.rightTop : BubbleNip.leftTop,
    color: isSender ? Colors.blue : Colors.grey[300],
    child: Text(chatMessage.content,
        style: TextStyle(color: isSender ? Colors.white : Colors.black)),
  );
}

Widget buildMessageList(List<ChatMessages> messages, String currentUserId) {
  return ListView.builder(
    reverse: true,
    itemCount: messages.length,
    itemBuilder: (context, index) {
      final message = messages[index];
      final isSender = message.idFrom == currentUserId;
      return buildMessageItem(message, isSender);
    },
  );
}
