import 'package:flutter/widgets.dart';

class ProfileStatus {}

class ProfileInitial extends ProfileStatus {}

class ProfilLoading extends ProfileStatus {}

class ProfileSuccess extends ProfileStatus {
  final ImageProvider<Object> imageProvider;

  ProfileSuccess(this.imageProvider);
}

class ProfileFailure extends ProfileStatus {
  final String error;

  ProfileFailure(this.error);
}
