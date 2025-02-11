import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  String method;
  double amount;
  double discount;
  double subtotal;
  String coupon;
  String paymentStatus;
  double totalAmount;
  double rate;
  PaymentModel({
    required this.method,
    required this.amount,
    required this.discount,
    required this.subtotal,
    required this.coupon,
    required this.paymentStatus,
    required this.totalAmount,
    required this.rate,
  });
  factory PaymentModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PaymentModel(
      method: data['method'] ?? '',
      amount: (data['amount'] ?? 0).toDouble(),
      discount: (data['discount'] ?? 0).toDouble(),
      subtotal: (data['subtotal'] ?? 0).toDouble(),
      coupon: data['coupon'] ?? '',
      paymentStatus: data['paymentStatus'] ?? '',
      totalAmount: (data['totalAmount'] ?? 0).toDouble(),
      rate: (data['rate'] ?? 0).toDouble(),
    );
  }
  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      method: map['method'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      discount: (map['discount'] ?? 0).toDouble(),
      subtotal: (map['subtotal'] ?? 0).toDouble(),
      coupon: map['coupon'] ?? '',
      paymentStatus: map['paymentStatus'] ?? '',
      totalAmount: (map['totalAmount'] ?? 0).toDouble(),
      rate: (map['rate'] ?? 0).toDouble(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'amount': amount,
      'discount': discount,
      'subtotal': subtotal,
      'coupon': coupon,
      'paymentStatus': paymentStatus,
      'totalAmount': totalAmount,
      'rate': rate,
    };
  }
}
