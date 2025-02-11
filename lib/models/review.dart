import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewsModel {
  String userName;
  String imagePath;
  String review;
  double rate;
  String date;
  ReviewsModel(
      {required this.userName,
      required this.imagePath,
      required this.rate,
      required this.review,
      required this.date});
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'imagePath': imagePath,
      'rate': rate,
      'review': review,
      'date': date,
    };
  }

  factory ReviewsModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReviewsModel(
      userName: data['userName'] ?? '',
      imagePath: data['imagePath'] ?? '',
      rate: (data['rate'] ?? 0).toDouble(),
      review: data['review'] ?? '',
      date: data['date'] ?? '',
    );
  }
  factory ReviewsModel.fromMap(Map<String, dynamic> map) {
    return ReviewsModel(
      userName: map['userName'],
      imagePath: map['imagePath'],
      rate: (map['rate'] ?? 0).toDouble(),
      review: map['review'],
      date: map['date'],
    );
  }
}
