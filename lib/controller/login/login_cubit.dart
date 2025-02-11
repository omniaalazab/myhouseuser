import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:housemanuser/controller/login/login_state.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginCubit extends Cubit<LoginStatus> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  LoginCubit() : super(LoginInitial());
  Future<void> resetPassword(String mail) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: mail);
      CreateDialogToaster.showSucessToast('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      CreateDialogToaster.showErrorToast('Error: ${e.message}');
    }
  }

  late String verificationId;
  Future<void> callNumberPhone() async {
    const phoneNumber = '+201019312511';
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      emit(LoginFailure('Could not launch $url'));
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber, var context) async {
    CreateDialogToaster.showErrorDialogDefult(
      "loading",
      "Please wait...",
      context,
    );
    try {
      await firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await firebaseAuth.signInWithCredential(credential);
          emit(LoginSuccess(userCredential.user!));
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(LoginFailure(e.toString()));
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          log(phoneNumber);
          emit(AuthCodeSent());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
      Navigator.pop(context);
    } catch (e) {
      emit(LoginFailure(e.toString()));
      Navigator.pop(context);
    }
  }

  Future<void> signInWithPhoneNumber(String smsCode, var context) async {
    CreateDialogToaster.showErrorDialogDefult(
      "loading",
      "Please wait...",
      context,
    );
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
                emit(LoginSuccess(userCredential.user!));
    } catch (e) {
      log(e.toString());
      emit(LoginFailure(e.toString()));
    }
    Navigator.pop(context);
  }

  loginWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      emit(LoginSuccess(userCredential.user!));
      return userCredential;
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> loginwithEmailAndPassword(
      {required String email, required String password, var context}) async {
    CreateDialogToaster.showErrorDialogDefult(
      "loading",
      "Please wait...",
      context,
    );
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess(userCredential.user!));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
    Navigator.pop(context);
  }
}
