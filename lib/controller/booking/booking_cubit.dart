import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/booking/booking_states.dart';
import 'package:housemanuser/models/booking_model.dart';

class BookingCubit extends Cubit<BookingStatus> {
  BookingCubit() : super(BookingInitial());
  Future<void> getAllBookingList() async {
    emit(BookingLoading());
    try {
      final querySnapShot =
          await FirebaseFirestore.instance.collection("booking").get();
      List<BookingModel> book = querySnapShot.docs
          .map((doc) => BookingModel.fromSnapshot(doc))
          .toList();
      log("fetchedbook $book");
      emit(Bookingloaded(book));
    } catch (e) {
      log(e.toString());
      emit(BookingFailure(e.toString()));
    }
  }

  Future<void> removeBooking(String bookingId) async {
    try {
      await FirebaseFirestore.instance
          .collection("booking")
          .doc(bookingId)
          .delete();
      log("Booking with ID $bookingId removed successfully.");
      getAllBookingList(); // Fetch updated booking list after removal
    } catch (e) {
      log("Error removing booking: $e");
      emit(BookingFailure(e.toString()));
    }
  }

  Future<void> addBooking(BookingModel booking) async {
    try {
      await FirebaseFirestore.instance
          .collection("booking")
          .add(booking.toMap());
      log("Booking added successfully.");
      getAllBookingList(); // Fetch updated booking list after adding
    } catch (e) {
      log("Error adding booking: $e");
      emit(BookingFailure(e.toString()));
    }
  }
}
