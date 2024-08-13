import '../../../data/models/city_model.dart';
import 'package:equatable/equatable.dart';

abstract class CityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CitySuccess extends CityState {
  final List<CityModel> citiesModels;

  CitySuccess(this.citiesModels);
  @override
  List<Object?> get props => [citiesModels];
  static CitySuccess fromJson(List<dynamic> response) {
    final cities = (response).map((e) => CityModel.fromJson(e)).toList();
    return CitySuccess(cities);
  }
}

class CityFailure extends CityState {
  final String errorMessage;
  CityFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static CityFailure fromJson(Map<String, dynamic> response) {
    return CityFailure(response['message'] ?? 'Unknown error');
  }
}
