

import '../../../data/models/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable{

  @override
  List<Object?> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountrySuccess extends CountryState {
  final List<CountryModel> destinationModels;

  CountrySuccess(this.destinationModels);
  @override
  List<Object?> get props => [destinationModels];
  static CountrySuccess fromJson(List<dynamic> response) {
    final destinations = (response )
        .map((e) => CountryModel.fromJson(e))
        .toList();
    return CountrySuccess(destinations);
  }
}


class CountryFailure extends CountryState {
  final String errorMessage;
  CountryFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static CountryFailure fromJson(Map<String, dynamic> response) {
    return CountryFailure(response['message'] ?? 'Unknown error');
  }



}
