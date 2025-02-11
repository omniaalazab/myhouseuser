import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/reset_password/reset_state.dart';

class ResetCubit extends Cubit<ResetStatus> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ResetCubit() : super(ResetInitial());
  Future<void> resetPassword(
    String mail,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: mail);
      emit(ResetSuccess());
    } catch (e) {
      emit(ResetFailure(e.toString()));
    }
  }
}
