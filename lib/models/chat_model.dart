import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessages {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  ChatMessages(
      {required this.idFrom,
      required this.idTo,
      required this.timestamp,
      required this.content,
      required this.type});

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.content: content,
      FirestoreConstants.type: type,
    };
  }

  factory ChatMessages.fromMap(Map<String, dynamic> map) {
    return ChatMessages(
      content: map["content"],
      idFrom: map["idFrom"],
      idTo: map["idTo"],
      timestamp: map["timestamp"],
      type: map["type"],
    );
  }
  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    String idFrom = documentSnapshot.get(FirestoreConstants.idFrom);
    String idTo = documentSnapshot.get(FirestoreConstants.idTo);
    String timestamp = documentSnapshot.get(FirestoreConstants.timestamp);
    String content = documentSnapshot.get(FirestoreConstants.content);
    int type = documentSnapshot.get(FirestoreConstants.type);

    return ChatMessages(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}

class FirestoreConstants {
  static const String idFrom = 'idFrom';
  static const String idTo = 'idTo';
  static const String timestamp = 'timestamp';
  static const String content = 'content';
  static const String type = 'type';

  // Add any other constants related to Firestore fields here
}
