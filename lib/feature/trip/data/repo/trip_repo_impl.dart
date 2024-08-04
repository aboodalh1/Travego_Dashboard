import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego_dashboard/core/domain/services/api.dart';
import 'package:travego_dashboard/core/errors/failure.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/city_model/city_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/country_cubit/country_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/create_trip_state.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/hotel_cubit/hotel_state.dart';

import '../../../../core/utils/config.dart';
import '../../presentation/manager/services_cubit/services_state.dart';
import '../models/trip_model.dart';

class TripRepoImpl extends TripRepo{
  final ApiServices api;

  TripRepoImpl({required this.api});
  @override
  Future<Either<Failure, CountrySuccess>> getCountries()async {
    try {
      var response = await api.get(Confg.allCountriesUrl, hasToken: true);
      print(response);
      return right(CountrySuccess.fromJson(response['body']));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CitySuccess>> getCities() async{
    print("from city");
    try {
      var response = await api.get(Confg.allCitiesUrl, hasToken: true);
      print("city : $response");
      return right(CitySuccess.fromJson(response['body']));
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HotelSuccess>> getHotels()async {
    try {
      var response = await api.get(Confg.allHotelsUrl, hasToken: true);
      print("hotellllll : $response");
      return right(HotelSuccess.fromJson(response['body']));
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServicesSuccess>> getServices()async {
    try {
      var response = await api.get(Confg.allServicesUrl, hasToken: true);
      print("servixxxcccccc : $response");
      return right(ServicesSuccess.fromJson(response['body']));
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TripSuccess>> posTrip(TripModel trip) async{
    try {
      var response = await api.post(Confg.createTripUrl, hasToken: true,
      body: trip.toJson());
      print("servixxxcccccc : $response");
      return right(TripSuccess(response['message']));
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

}