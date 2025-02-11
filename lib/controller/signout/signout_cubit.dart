import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/signout/signout_state.dart';

class SignOutCubit extends Cubit<SignoutStatus> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SignOutCubit() : super(InitialStatus());
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      log("*************************************");
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
