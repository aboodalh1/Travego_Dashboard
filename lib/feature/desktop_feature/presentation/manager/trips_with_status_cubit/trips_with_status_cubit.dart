import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/up_coming_model/up_coming_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo.dart';

part 'trips_with_status_state.dart';

class TripsWithStatusCubit extends Cubit<TripsWithStatusState> {
  TripsWithStatusCubit(this.desktopRepo) : super(TripsWithStatusInitial());
  final DesktopRepo desktopRepo;
  Future<void> fetchTripsWithStatusFun({required String status}) async {
    emit(TripsWithStatusLoading());

    var result = await desktopRepo.getTripsWithStatus(status: status);

    result.fold((failure) {
      print(failure.errMessage);
      emit(TripsWithStatusFailure(errMessage: failure.errMessage));
    }, (tripsWithStatusModel) {
      emit(TripsWithStatusSuccess(tripsWithStatusModel: tripsWithStatusModel));
    });
  }
}
