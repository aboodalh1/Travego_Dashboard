import 'package:travego_dashboard/feature/trip/data/models/trip_model.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/city_model/city_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/country_cubit/country_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/create_trip_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/hotel_cubit/hotel_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/services_cubit/services_state.dart';

import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TripRepo {
  Future<Either<Failure, CountrySuccess>> getCountries();
  Future<Either<Failure, CitySuccess>> getCities();
  Future<Either<Failure, HotelSuccess>> getHotels();
  Future<Either<Failure, ServicesSuccess>> getServices();
  Future<Either<Failure, TripSuccess>> posTrip(TripModel trip);
}
