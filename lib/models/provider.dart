import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderModel {
  String imagePath;
  String providerName;
  String providerImage;
  double rate;
  String serviceDescriptionAr;
  String serviceDescriptionEn;
  String serviceNameAr;
  String serviceNameEn;
  String serviceImage;
  double price;
  ProviderModel(
      {required this.imagePath,
      required this.providerName,
      required this.providerImage,
      required this.rate,
      required this.serviceDescriptionAr,
      required this.serviceDescriptionEn,
      required this.serviceNameAr,
      required this.serviceNameEn,
      required this.serviceImage,
      required this.price});
  factory ProviderModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProviderModel(
      imagePath: data['imagePath'],
      providerName: data['providerName'],
      providerImage: data['providerImage'],
      serviceDescriptionAr: data['serviceDescriptionAr'] ?? '',
      serviceDescriptionEn: data['serviceDescriptionEn'] ?? '',
      serviceNameAr: data['serviceNameAr'] ?? '',
      serviceNameEn: data['serviceNameEn'] ?? '',
      serviceImage: data['serviceImage'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      rate: (data['rate'] ?? 0).toDouble(),
    );
  }
  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      imagePath: map['imagePath'],
      providerName: map['providerName'],
      providerImage: map['providerImage'],
      serviceDescriptionAr: map['serviceDescriptionAr'] ?? '',
      serviceDescriptionEn: map['serviceDescriptionEn'] ?? '',
      serviceNameAr: map['serviceNameAr'] ?? '',
      serviceNameEn: map['serviceNameEn'] ?? '',
      serviceImage: map['serviceImage'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      rate: (map['rate'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'providerName': providerName,
      'providerImage': providerImage,
      'serviceDescriptionAr': serviceDescriptionAr,
      'serviceDescriptionEn': serviceDescriptionEn,
      'serviceNameAr': serviceNameAr,
      'serviceNameEn': serviceNameEn,
      'serviceImage': serviceImage,
      'price': price,
      'rate': rate,
    };
  }
}
