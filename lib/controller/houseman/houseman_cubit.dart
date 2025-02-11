import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/houseman/houseman_state.dart';
import 'package:housemanuser/models/houseman_model.dart';

class HousemanCubit extends Cubit<HousemanStatus> {
  HousemanCubit() : super(HousemanInitial());
  Future<void> getAllHouseman() async {
    emit(HousemanLoading());
    try {
      final querySnapShot =
          await FirebaseFirestore.instance.collection("houseman").get();

      List<HousemanModel> houseman = querySnapShot.docs
          .map((doc) => HousemanModel.fromSnapshot(doc))
          .toList();
      emit(Housemanloaded(houseman));
    } catch (e) {
      emit(HousemanFailure(e.toString()));
    }
  }

  Future<void> addHouseman(HousemanModel houseman) async {
    try {
      await FirebaseFirestore.instance
          .collection("houseman")
          .add(houseman.toMap());
      log("Booking added successfully.");
      getAllHouseman(); // Fetch updated booking list after adding
    } catch (e) {
      log("Error adding booking: $e");
      emit(HousemanFailure(e.toString()));
    }
  }

  Future<void> updateRatingHouseman(String name, double rating) async {
    FirebaseFirestore.instance
        .collection('houseman')
        .doc(name)
        .update({'rate': rating}).then((_) {
      log('Rating updated to $rating');
    }).catchError((error) {
      log('Failed to update rating: $error');
    });
  }
}
