import 'package:travego_dashboard/feature/trip/presentation/manager/country_cubit/country_state.dart';

import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TripRepo {
  Future<Either<Failure, CountrySuccess>> getCountries();
  // Future<Either<Failure, UserModel>> getUser();
}
