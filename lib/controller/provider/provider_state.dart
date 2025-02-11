import 'package:housemanuser/models/provider.dart';

class ProviderStatus {}

class ProviderInitial extends ProviderStatus {}

class ProviderLoading extends ProviderStatus {}

class Providerloaded extends ProviderStatus {
  final List<ProviderModel> providerList;
  Providerloaded(this.providerList);
}

class ProviderFailure extends ProviderStatus {
  final String errorMessage;

  ProviderFailure(this.errorMessage);
}
