part of 'hotel_details_cubit_cubit.dart';

@immutable
sealed class HotelDetailsCubitState {}

final class HotelDetailsCubitInitial extends HotelDetailsCubitState {}

final class HotelDetailsCubitLoading extends HotelDetailsCubitState {}

final class HotelDetailsCubitSuccess extends HotelDetailsCubitState {
  final HotelDetailsModel hotelDetailsModel;

  HotelDetailsCubitSuccess({required this.hotelDetailsModel});
}

final class HotelDetailsCubitFailure extends HotelDetailsCubitState {
  final String errMessage;

  HotelDetailsCubitFailure({required this.errMessage});
}
