import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/search/search_state.dart';
import 'package:housemanuser/models/services_models.dart';

class SearchServiceCubit extends Cubit<SearchServiceStatus> {
  SearchServiceCubit() : super(SearchServiceInitial());
  List<ServicesModel> servicesProduct = [];
  List<ServicesModel> resultServicesList = [];

  Future<void> getFirestoreDocuments() async {
    emit(SearchServiceLoading());
    try {
      final data = await FirebaseFirestore.instance
          .collection('services')
          .orderBy('imagePathService')
          .get();
      servicesProduct =
          data.docs.map((doc) => ServicesModel.fromSnapshot(doc)).toList();
      log("----------------------------------------------*****----------------");
      emit(SearchServiceLoaded(servicesProduct));
    } catch (e) {
      emit(SearchServiceFailure(e.toString()));
    }
  }

  void searchResultList(String query, BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;

    log('Locale: $locale');
    log('Query: $query');

    if (query.isEmpty) {
      resultServicesList = List.from(servicesProduct);
    } else {
      resultServicesList = servicesProduct.where((service) {
        if (locale == 'en') {
          return service.nameServiceEn
              .toLowerCase()
              .contains(query.toLowerCase());
        } else if (locale == 'ar') {
          return service.nameServiceAr
              .toLowerCase()
              .contains(query.toLowerCase());
        }
        return false;
      }).toList();
    }

    log('Result list length: ${resultServicesList.length}');

    if (resultServicesList.isNotEmpty) {
      emit(SearchServiceSuccess(resultServicesList));
    } else {
      emit(SearchServiceFailure('No Services found'));
    }
  }
}
