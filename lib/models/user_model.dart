import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String userName;
  String userMail;
  String userFullName;
  String userPassword;
  String phoneNumber;
  String profileImage;
  // String? address;
  // String? city;
  // String? state;
  // String? country;
  Users({
    required this.userName,
    required this.userMail,
    required this.userPassword,
    required this.phoneNumber,
    required this.userFullName,
    this.profileImage = "",
    // required this.address,
    // required this.city,
    // required this.state,
    // required this.country,
  });
  factory Users.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Users(
      userName: data['userName'] ?? "",
      userMail: data['userMail'] ?? "",
      userFullName: data['userFullName'] ?? "",
      userPassword: data['userPassword'] ?? "",
      phoneNumber: data['phoneNumber'] ?? "",
      profileImage: data['profileImage'] ?? "",
      // Initialize other fields from data
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userMail': userMail,
      'userFullName': userFullName,
      'userPassword': userPassword,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      // 'address': address,
      // 'city': city,
      // 'state': state,
      // 'country': country,
    };
  }

  factory Users.fromMap(Map<dynamic, dynamic> map) {
    return Users(
      userName: map['userName'],
      userMail: map['userMail'],
      userFullName: map['userFullName'],
      userPassword: map['userPassword'],
      phoneNumber: map['phoneNumber'],
      profileImage: map['profileImage'],
      // address: map['address'],
      // city: map['city'],
      // state: map['state'],
      // country: map['country'],
    );
  }
}
