import 'package:housemanuser/models/booking_model.dart';

class BookingStatus {}

class BookingInitial extends BookingStatus {}

class BookingLoading extends BookingStatus {}

class Bookingloaded extends BookingStatus {
  final List<BookingModel> bookingList;
  Bookingloaded(this.bookingList);
}

class BookingFailure extends BookingStatus {
  final String errorMessage;

  BookingFailure(this.errorMessage);
}