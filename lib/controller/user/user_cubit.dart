import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/user/user_state.dart';
import 'package:housemanuser/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserCubit() : super(UserState(user: []));
  Future<void> addUser({
    required String userMail,
    required String userName,
    required String userPassword,
    required String phoneNumber,
    required String userFullName,
    String? profileImage,
    // String? address,
    // String? city,
    // String? state,
    // String? country,
  }) async {
    final user = Users(
      userMail: userMail,
      userName: userName,
      userPassword: userPassword,
      userFullName: userFullName,
      phoneNumber: phoneNumber,
      // profileImage: profileImage ??
      //     "https://louisville.edu/enrollmentmanagement/images/person-icon/image",
      // address: address ,
      // city: city,
      // country: country ,
      // state: state ,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userMail)
        .set(user.toMap());

    final newUser = List<Users>.from(state.user);
    log("****************");
    newUser.add(user);
    emit(UserState(user: newUser));
  }

  Future<void> fetchUserData() async {
    User? user1 = FirebaseAuth.instance.currentUser;
    if (user1 != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userMail', isEqualTo: user1.email)
          .get();
      final user =
          snapshot.docs.map((doc) => Users.fromMap(doc.data())).toList();
      emit(UserState(user: user));
    }
  }

  Future<void> fetchAllUsersData() async {
    User? user1 = FirebaseAuth.instance.currentUser;
    if (user1 != null) {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();
      final user =
          snapshot.docs.map((doc) => Users.fromMap(doc.data())).toList();
      emit(UserState(user: user));
    }
  }

  Future<void> updateUser({
    required String userMail,
    String? userName,
    String? userPassword,
    String? phoneNumber,
    String? userFullName,
    String? profileImage,
    String? state,
    String? country,
    String? address,
    String? city,
  }) async {
    final updateData = <String, dynamic>{};

    if (userName != null) updateData['userName'] = userName;
    if (userPassword != null) updateData['userPassword'] = userPassword;
    if (phoneNumber != null) updateData['phoneNumber'] = phoneNumber;
    if (userFullName != null) updateData['userFullName'] = userFullName;
    if (profileImage != null) updateData['profileImage'] = profileImage;
    if (state != null) updateData['userFullName'] = state;
    if (country != null) updateData['userFullName'] = country;
    if (address != null) updateData['userFullName'] = address;
    if (city != null) updateData['userFullName'] = city;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userMail)
        .update(updateData);

    // Fetch updated user data
    await fetchUserData();
  }
}
