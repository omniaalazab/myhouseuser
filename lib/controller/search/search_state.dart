import 'package:housemanuser/models/services_models.dart';

class SearchServiceStatus {}

class SearchServiceInitial extends SearchServiceStatus {}

class SearchServiceLoading extends SearchServiceStatus {}

class SearchServiceLoaded extends SearchServiceStatus {
  final List<ServicesModel> serviceModel;
  SearchServiceLoaded(this.serviceModel);
}

class SearchServiceSuccess extends SearchServiceStatus {
  final List<ServicesModel> serviceModel;
  SearchServiceSuccess(this.serviceModel);
}

class SearchServiceFailure extends SearchServiceStatus {
  final String errorMessage;

  SearchServiceFailure(this.errorMessage);
}
