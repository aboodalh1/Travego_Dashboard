import 'package:bloc/bloc.dart';
import 'package:travego_dashboard/feature/trip/data/models/hotel_model.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';

import 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final TripRepo destinationRepo;
  List<HotelModel> hotels = [];
  HotelCubit(this.destinationRepo) : super(HotelInitial());

  Future<void> fetchAllHotels() async {
    print("staaaaaaaaat");
    emit(HotelLoading());

    var result = await destinationRepo.getHotels();
    result.fold(
      (failure) {
        print(failure.errMessage);

        emit(HotelFailure(failure.errMessage));
      },
      (success) async {
        print("Succcesssssssss");
        hotels = success.citiesModels;
        emit(HotelSuccess(success.citiesModels));
      },
    );
  }
}
