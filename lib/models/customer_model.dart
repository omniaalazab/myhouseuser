import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  String customerName;
  String customerLocation;
  String customerMail;
  String customerImagePath;
  CustomerModel({
    required this.customerName,
    required this.customerMail,
    required this.customerLocation,
    required this.customerImagePath,
  });
  factory CustomerModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CustomerModel(
      customerName: data['customerName'] ?? '',
      customerLocation: data['customerLocation'] ?? '',
      customerMail: data['customerMail'] ?? "",
      customerImagePath: data['customerImagePath'] ?? '',
    );
  }
  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      customerName: map['customerName'],
      customerImagePath: map['customerImagePath'],
      customerLocation: map['customerLocation'],
      customerMail: map['customerMail'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'customerMail': customerMail,
      'customerLocation': customerLocation,
      'customerImagePath': customerImagePath,
    };
  }
}
