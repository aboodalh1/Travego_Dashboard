

import 'package:bloc/bloc.dart';
import 'package:travego_dashboard/feature/trip/data/models/country_model.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';

import 'country_state.dart';


class CountryCubit extends Cubit<CountryState> {
  final TripRepo destinationRepo;
   List<CountryModel> countries=[];
  CountryCubit( this.destinationRepo) : super(CountryInitial());

  Future<void> fetchAllCountries() async {
    print("staaaaaaaaat");
    emit(CountryLoading());

    var result = await destinationRepo.getCountries();
    result.fold(
          (failure)
          {
            print(failure.errMessage);

            emit(CountryFailure(failure.errMessage));
            },
          (success) async {
            print("Succcesssssssss");
                    countries=success.destinationModels;
        emit(CountrySuccess(success.destinationModels));

      },
    );
  }


}
