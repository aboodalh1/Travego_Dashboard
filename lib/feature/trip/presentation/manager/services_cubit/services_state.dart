

import 'package:travego_dashboard/feature/trip/data/models/hotel_model.dart';
import 'package:travego_dashboard/feature/trip/data/models/services_model.dart';

import '../../../data/models/city_model.dart';
import '../../../data/models/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class ServicesState extends Equatable{

  @override
  List<Object?> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  final List<ServiceModel> services;

  ServicesSuccess(this.services);
  @override
  List<Object?> get props => [services];
  static ServicesSuccess fromJson(List<dynamic> response) {
    final services = (response )
        .map((e) => ServiceModel.fromJson(e))
        .toList();
    return ServicesSuccess(services);
  }
}


class ServicesFailure extends ServicesState {
  final String errorMessage;
  ServicesFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static ServicesFailure fromJson(Map<String, dynamic> response) {
    return ServicesFailure(response['message'] ?? 'Unknown error');
  }



}
