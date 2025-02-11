import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:housemanuser/models/houseman_model.dart';

class ServicesModel {
  String imagePathService;
  String nameServiceEn;
  String nameServiceAr;
  double price;
  String address;
  String descriptionAr;
  String descriptionEn;
  String duration;

  HousemanModel houseman;
  ServicesModel(
      {required this.imagePathService,
      required this.nameServiceEn,
      required this.nameServiceAr,
      required this.price,
      required this.duration,
      required this.descriptionAr,
      this.address = "",
      required this.descriptionEn,
      required this.houseman});
  factory ServicesModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServicesModel(
      imagePathService: data['imagePathService'] ?? '',
      nameServiceEn: data['nameServiceEn'] ?? '',
      nameServiceAr: data['nameServiceAr'] ?? '',
      descriptionEn: data['descriptionEn'] ?? '',
      descriptionAr: data['descriptionAr'] ?? '',
      address: data['address'] ?? '',
      duration: data['duration'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      houseman: HousemanModel.fromMap(data['houseman'] ?? {}),
    );
  }
  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      nameServiceEn: map['nameServiceEn'],
      imagePathService: map['imagePathService'],
      nameServiceAr: map['nameServiceAr'],
      descriptionEn: map['descriptionEn'] ?? '',
      descriptionAr: map['descriptionAr'] ?? '',
      duration: map['duration'] ?? '',
      address: map['address'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      houseman: HousemanModel.fromMap(map['houseman'] ?? {}),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'nameServiceEn': nameServiceEn,
      'nameServiceAr': nameServiceAr,
      'imagePathService': imagePathService,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'duration': duration,
      'address': address,
      'price': price,
      'houseman': houseman.toMap(),
    };
  }
}
