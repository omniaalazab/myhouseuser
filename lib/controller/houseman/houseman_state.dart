import 'package:housemanuser/models/houseman_model.dart';

class HousemanStatus {}

class HousemanInitial extends HousemanStatus {}

class HousemanLoading extends HousemanStatus {}

class Housemanloaded extends HousemanStatus {
  final List<HousemanModel> housemanList;
  Housemanloaded(this.housemanList);
}

class HousemanFailure extends HousemanStatus {
  final String errorMessage;

  HousemanFailure(this.errorMessage);
}
