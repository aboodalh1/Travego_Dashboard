import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/all_hotels_model/all_hotels_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo.dart';

part 'all_hotels_state.dart';

class AllHotelsCubit extends Cubit<AllHotelsState> {
  AllHotelsCubit(this.desktopRepo) : super(AllHotelsInitial());
  final DesktopRepo desktopRepo;
  Future<void> fetchAllHotelsFun() async {
    emit(AllHotelsLoading());

    var result = await desktopRepo.getAllHotels();

    result.fold((failure) {
      print(failure.errMessage);
      emit(AllHotelsFailure(errMessage: failure.errMessage));
    }, (allHotelsModel) {
      emit(AllHotelsSuccess(allHotelsModel: allHotelsModel));
    });
  }
}
