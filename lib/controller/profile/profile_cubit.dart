import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/profile/profile_state.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileStatus> {
  ProfileCubit() : super(ProfileInitial());
  final ImagePicker picker = ImagePicker();

  Future<void> changeProfileImage(var context) async {
    try {
      CreateDialogToaster.showErrorDialogDefult(
          "Loading", "Image  Loading", context);
      emit(ProfilLoading());
      final XFile? pickImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        File imageFile = File(pickImage.path);
        String? userMail = FirebaseAuth.instance.currentUser!.email;
        Reference storge = FirebaseStorage.instance
            .ref()
            .child('profileImage')
            .child("$userMail.jpg");

        UploadTask uploadtask = storge.putFile(imageFile);
        TaskSnapshot snapShot = await uploadtask;
        String downloadUrl = await snapShot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userMail)
            .update({"profileImage": downloadUrl});

        emit(ProfileSuccess(NetworkImage(downloadUrl)));
      }
    } catch (e) {
      log(e.toString());
    }
    Navigator.pop(context);
  }

  Future<void> fetchProfileImage(context) async {
    CreateDialogToaster.showErrorDialogDefult(
        "Loading", "Image  Loading", context);
    try {
      String? userMail = FirebaseAuth.instance.currentUser!.email;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userMail)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        String? imageUrl = userDoc.get('profileImage') as String?;
        if (imageUrl != null && imageUrl.isNotEmpty) {
          emit(ProfileSuccess(NetworkImage(imageUrl)));
        } else {
          emit(ProfileInitial());
        }
      } else {
        emit(ProfileInitial());
      }
    } catch (e) {
      log(e.toString());
      emit(ProfileInitial());
    }
    Navigator.pop(context);
  }
}
