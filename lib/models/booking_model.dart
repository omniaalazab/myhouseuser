// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:housemanuser/models/customer_model.dart';
import 'package:housemanuser/models/history_model.dart';
import 'package:housemanuser/models/houseman_model.dart';
import 'package:housemanuser/models/payment_model.dart';

class BookingModel {
  String bookingId;
  String textBooking_en;
  String textBooking_ar;
  String date;
  String time;
  String imagePath;
  String houseLocation;
  String state_en;
  String state_ar;
  double price;
  double offer;
  CustomerModel customer;
  PaymentModel payment;

  BookingHistory history;
  HousemanModel houseman;

  BookingModel({
    required this.bookingId,
    required this.textBooking_en,
    required this.textBooking_ar,
    required this.date,
    required this.time,
    required this.imagePath,
    required this.houseLocation,
    required this.state_en,
    required this.state_ar,
    required this.price,
    required this.offer,
    required this.customer,
    required this.history,
    required this.payment,
    required this.houseman,
  });
  factory BookingModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BookingModel(
        bookingId: data['bookingId'] ?? '',
        imagePath: data['imagePath'] ?? '',
        textBooking_en: data['textBooking_en'] ?? "",
        textBooking_ar: data['textBooking_ar'] ?? "",
        houseLocation: data['houseLocation'] ?? '',
        date: data['date'] ?? '',
        time: data['time'] ?? '',
        state_en: data['state_en'] ?? '',
        state_ar: data['state_ar'] ?? '',
        price: (data['price'] ?? 0).toDouble(),
        offer: (data['offer'] ?? 0).toDouble(),
        customer: CustomerModel.fromMap(data['customer'] ?? {}),
        payment: PaymentModel.fromMap(data['payment'] ?? {}),
        history: BookingHistory.fromMap(data['history'] ?? {}),
        houseman: HousemanModel.fromMap(data['houseman'] ?? {}));
  }
  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      bookingId: map['bookingId'],
      imagePath: map['imagePath'],
      textBooking_en: map['textBooking_en'],
      textBooking_ar: map['textBooking_ar'],
      houseLocation: map['houseLocation'],
      date: map['date'],
      time: map['time'],
      state_en: map['state_en'],
      state_ar: map['state_ar'],
      price: map['price'],
      offer: map['offer'],
      customer: CustomerModel.fromMap(map['customer'] ?? {}),
      payment: PaymentModel.fromMap(map['payment'] ?? {}),
      history: BookingHistory.fromMap(map['history'] ?? {}),
      houseman: HousemanModel.fromMap(map['houseman'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'imagePath': imagePath,
      'textBooking_en': textBooking_en,
      'textBooking_ar': textBooking_ar,
      'houseLocation': houseLocation,
      'date': date,
      'time': time,
      'state_en': state_en,
      'state_ar': state_ar,
      'price': price,
      'offer': offer,
      'customer': customer.toMap(),
      'payment': payment.toMap(),
      'history': history.toMap(),
      'houseman': houseman.toMap(),
    };
  }
}
