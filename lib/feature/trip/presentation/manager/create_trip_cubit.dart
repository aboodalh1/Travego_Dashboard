import 'package:bloc/bloc.dart';
import 'package:travego_dashboard/feature/trip/data/models/trip_model.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/create_trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final TripRepo destinationRepo;
  TripCubit(this.destinationRepo) : super(TripInitial());

  Future<void> sendTrip(TripModel trip) async {
    print("staaaaaaaaat");
    emit(TripLoading());

    var result = await destinationRepo.posTrip(trip);
    result.fold(
      (failure) {
        print(failure.errMessage);

        emit(TripFailure(failure.errMessage));
      },
      (success) async {
        print("Succcesssssssss");
        emit(TripSuccess(success.message));
      },
    );
  }
}
