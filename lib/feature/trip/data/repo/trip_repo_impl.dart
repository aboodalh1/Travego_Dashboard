import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego_dashboard/core/domain/services/api.dart';
import 'package:travego_dashboard/core/errors/failure.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/country_cubit/country_state.dart';

import '../../../../core/utils/config.dart';

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

}