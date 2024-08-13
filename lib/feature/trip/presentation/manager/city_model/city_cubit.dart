import 'package:bloc/bloc.dart';
import 'package:travego_dashboard/feature/trip/data/models/city_model.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';

import 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final TripRepo destinationRepo;
  List<CityModel> countries = [];
  CityCubit(this.destinationRepo) : super(CityInitial());

  Future<void> fetchAllCities() async {
    print("staaaaaaaaat");
    emit(CityLoading());

    var result = await destinationRepo.getCities();
    result.fold(
      (failure) {
        print(failure.errMessage);

        emit(CityFailure(failure.errMessage));
      },
      (success) async {
        print("Succcesssssssss");
        countries = success.citiesModels;
        emit(CitySuccess(success.citiesModels));
      },
    );
  }
}
