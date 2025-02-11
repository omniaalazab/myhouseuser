import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/provider/provider_state.dart';

import 'package:housemanuser/models/provider.dart';

class ProviderCubit extends Cubit<ProviderStatus> {
  ProviderCubit() : super(ProviderInitial());
  Future<void> getAllProvider() async {
    emit(ProviderLoading());
    try {
      final querySnapShot =
          await FirebaseFirestore.instance.collection("provider").get();

      List<ProviderModel> services = querySnapShot.docs
          .map((doc) => ProviderModel.fromSnapshot(doc))
          .toList();
      emit(Providerloaded(services));
    } catch (e) {
      emit(ProviderFailure(e.toString()));
    }
  }

  Future<void> getSpecificProvider(String provider, var context) async {
    String locale = Localizations.localeOf(context).languageCode;
    emit(ProviderLoading());
    try {
      String field = locale == 'ar' ? 'serviceNameAr' : 'serviceNameEn';

      final querySnapShot = await FirebaseFirestore.instance
          .collection("provider")
          .where(field, isEqualTo: provider)
          .get();

      List<ProviderModel> providers = querySnapShot.docs
          .map((doc) => ProviderModel.fromSnapshot(doc))
          .toList();
      emit(Providerloaded(providers));
    } catch (e) {
      emit(ProviderFailure(e.toString()));
    }
  }
}
