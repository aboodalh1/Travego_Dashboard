

import 'package:travego_dashboard/feature/trip/data/models/hotel_model.dart';

import '../../../data/models/city_model.dart';
import '../../../data/models/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class HotelState extends Equatable{

  @override
  List<Object?> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelSuccess extends HotelState {
  final List<HotelModel> citiesModels;

  HotelSuccess(this.citiesModels);
  @override
  List<Object?> get props => [citiesModels];
  static HotelSuccess fromJson(List<dynamic> response) {
    final cities = (response )
        .map((e) => HotelModel.fromJson(e))
        .toList();
    return HotelSuccess(cities);
  }
}


class HotelFailure extends HotelState {
  final String errorMessage;
  HotelFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static HotelFailure fromJson(Map<String, dynamic> response) {
    return HotelFailure(response['message'] ?? 'Unknown error');
  }



}
