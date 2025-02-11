import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/models/chat_model.dart';

class ChatCubit extends Cubit<List<ChatMessages>> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  StreamSubscription? _subscription;
  ChatCubit() : super([]);
 

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  void sendChatMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    DocumentReference documentReference = firebaseFirestore
        .collection('newmessages')
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    ChatMessages chatMessages = ChatMessages(
      idFrom: currentUserId,
      idTo: peerId,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type,
    );

    firebaseFirestore.runTransaction((transaction) async {
      transaction.set(documentReference, chatMessages.toJson());
    });
  }

  void getChatMessages(String groupChatId, int limit) {
    firebaseFirestore
        .collection('newmessages')
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .listen((snapshot) {
      List<ChatMessages> messages =
          snapshot.docs.map((doc) => ChatMessages.fromDocument(doc)).toList();
      emit(messages);
    });
  }
}
