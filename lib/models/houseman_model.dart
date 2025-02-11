import 'package:cloud_firestore/cloud_firestore.dart';

class HousemanModel {
  String imagePath;
  String name;
  double rate;
  String address;
  String housemanMail;
  String housemanPhone;

  HousemanModel(
      {required this.imagePath,
      required this.name,
      required this.rate,
      required this.address,
      required this.housemanMail,
      required this.housemanPhone});
  factory HousemanModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HousemanModel(
      imagePath: data['imagePath'] ?? '',
      address: data['address'] ?? '',
      housemanMail: data['housemanMail'] ?? '',
      housemanPhone: data['housemanPhone'] ?? '',
      name: data['name'] ?? '',
      rate: (data['rate'] ?? 0).toDouble(),
    );
  }
  factory HousemanModel.fromMap(Map<String, dynamic> map) {
    return HousemanModel(
      name: map['name'],
      imagePath: map['imagePath'],
      address: map['address'] ?? '',
      housemanMail: map['housemanMail'] ?? '',
      housemanPhone: map['housemanPhone'] ?? '',
      rate: (map['rate'] ?? 0).toDouble(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imagePath': imagePath,
      "address": address,
      "housemanMail": housemanMail,
      "housemanPhone": housemanPhone,
      'rate': rate,
    };
  }
}
