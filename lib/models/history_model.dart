// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingHistory {
  final Newbooking newbooking;
  final Acceptedbooking acceptedbooking;
  final AssignedBooking assignedbooking;

  BookingHistory({
    required this.newbooking,
    required this.acceptedbooking,
    required this.assignedbooking,
  });
  factory BookingHistory.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BookingHistory(
      newbooking: Newbooking.fromMap(data['newbooking'] ?? {}),
      acceptedbooking: Acceptedbooking.fromMap(data['acceptedbooking'] ?? {}),
      assignedbooking: AssignedBooking.fromMap(data['assignedbooking'] ?? {}),
    );
  }
  factory BookingHistory.fromMap(Map<String, dynamic> map) {
    return BookingHistory(
      newbooking: Newbooking.fromMap(map['newbooking'] ?? {}),
      acceptedbooking: Acceptedbooking.fromMap(map['acceptedbooking'] ?? {}),
      assignedbooking: AssignedBooking.fromMap(map['assignedbooking'] ?? {}),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'newbooking': newbooking.toMap(),
      'acceptedbooking': acceptedbooking.toMap(),
      'assignedbooking': assignedbooking.toMap(),
    };
  }
}

class Newbooking {
  String? title_en;
  String? title_ar;
  String? description_en;
  String? description_ar;
  DateTime? dateTime;

  Newbooking({
    required this.title_en,
    required this.title_ar,
    required this.description_en,
    required this.description_ar,
    required this.dateTime,
  });
  factory Newbooking.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Newbooking(
      title_en: data['title_en'] ?? '',
      title_ar: data['title_ar'] ?? '',
      description_en: data['description_en'] ?? '',
      description_ar: data['description_ar'] ?? '',
      dateTime: (data['dateTime'] as Timestamp?)?.toDate(),
    );
  }
  factory Newbooking.fromMap(Map<String, dynamic> map) {
    return Newbooking(
      title_en: map['title_en'] ?? '',
      title_ar: map['title_ar'] ?? '',
      description_en: map['description_en'] ?? '',
      description_ar: map['description_ar'] ?? '',
      dateTime: (map['dateTime'] as Timestamp?)?.toDate(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title_en': title_en,
      'title_ar': title_ar,
      'description_en': description_en,
      'description_ar': description_ar,
      'dateTime': dateTime != null ? Timestamp.fromDate(dateTime!) : null,
    };
  }
}

class Acceptedbooking {
  String? title_en;
  String? title_ar;
  String? description_en;
  String? description_ar;
  DateTime? dateTime;

  Acceptedbooking({
    required this.title_en,
    required this.title_ar,
    required this.description_en,
    required this.description_ar,
    required this.dateTime,
  });
  factory Acceptedbooking.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Acceptedbooking(
      title_en: data['title_en'] ?? '',
      title_ar: data['title_ar'] ?? '',
      description_en: data['description_en'] ?? '',
      description_ar: data['description_ar'] ?? '',
      dateTime: (data['dateTime'] as Timestamp?)?.toDate(),
    );
  }
  factory Acceptedbooking.fromMap(Map<String, dynamic> map) {
    return Acceptedbooking(
      title_en: map['title_en'] ?? '',
      title_ar: map['title_ar'] ?? '',
      description_en: map['description_en'] ?? '',
      description_ar: map['description_ar'] ?? '',
      dateTime: (map['dateTime'] as Timestamp?)?.toDate(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title_en': title_en,
      'title_ar': title_ar,
      'description_en': description_en,
      'description_ar': description_ar,
      'dateTime': dateTime != null ? Timestamp.fromDate(dateTime!) : null,
    };
  }
}

class AssignedBooking {
  String? title_en;
  String? title_ar;
  String? description_en;
  String? description_ar;
  DateTime? dateTime;

  AssignedBooking({
    required this.title_en,
    required this.title_ar,
    required this.description_en,
    required this.description_ar,
    required this.dateTime,
  });
  factory AssignedBooking.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AssignedBooking(
      title_en: data['title_en'] ?? '',
      title_ar: data['title_ar'] ?? '',
      description_en: data['description_en'] ?? '',
      description_ar: data['description_ar'] ?? '',
      dateTime: (data['dateTime'] as Timestamp?)?.toDate(),
    );
  }
  factory AssignedBooking.fromMap(Map<String, dynamic> map) {
    return AssignedBooking(
      title_en: map['title_en'] ?? '',
      title_ar: map['title_ar'] ?? '',
      description_en: map['description_en'] ?? '',
      description_ar: map['description_ar'] ?? '',
      dateTime: (map['dateTime'] as Timestamp?)?.toDate(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title_en': title_en,
      'title_ar': title_ar,
      'description_en': description_en,
      'description_ar': description_ar,
      'dateTime': dateTime != null ? Timestamp.fromDate(dateTime!) : null,
    };
  }
}
