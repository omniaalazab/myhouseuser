import 'package:firebase_auth/firebase_auth.dart';

class LoginStatus {}

class LoginInitial extends LoginStatus {}

class LoginLoading extends LoginStatus {}

class AuthCodeSent extends LoginStatus {}

class LoginSuccess extends LoginStatus {
  final User user;

  LoginSuccess(this.user);
}

class LoginFailure extends LoginStatus {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}