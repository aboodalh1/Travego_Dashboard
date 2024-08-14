import 'package:dartz/dartz.dart';
import 'package:travego_dashboard/core/errors/failure.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/all_hotels_model/all_hotels_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/hotel_details_model/hotel_details_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/up_coming_model/up_coming_model.dart';

abstract class DesktopRepo {
  Future<Either<Failure, TripsWithStatusModel>> getTripsWithStatus(
      {required String status});
  Future<Either<Failure, AllHotelsModel>> getAllHotels();
  Future<Either<Failure, HotelDetailsModel>> getHotelDetails({required int id});
}
