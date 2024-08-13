import 'package:equatable/equatable.dart';

abstract class TripState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripSuccess extends TripState {
  final String message;

  TripSuccess(this.message);
// static TripSuccess fromJson(List<dynamic> response) {
//   final cities = (response )
//       .map((e) => HotelModel.fromJson(e))
//       .toList();
//   return TripSuccess(cities);
// }
}

class TripFailure extends TripState {
  final String errorMessage;
  TripFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static TripFailure fromJson(Map<String, dynamic> response) {
    return TripFailure(response['message'] ?? 'Unknown error');
  }
}
