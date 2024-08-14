import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/hotel_details_model/hotel_details_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo.dart';

part 'hotel_details_cubit_state.dart';

class HotelDetailsCubitCubit extends Cubit<HotelDetailsCubitState> {
  HotelDetailsCubitCubit(this.desktopRepo) : super(HotelDetailsCubitInitial());
  final DesktopRepo desktopRepo;
  Future<void> fetchHotelDetailsFun({required int id}) async {
    emit(HotelDetailsCubitLoading());

    var result = await desktopRepo.getHotelDetails(id: id);

    result.fold((failure) {
      print(failure.errMessage);
      emit(HotelDetailsCubitFailure(errMessage: failure.errMessage));
    }, (hotelDetailsModel) {
      emit(HotelDetailsCubitSuccess(hotelDetailsModel: hotelDetailsModel));
    });
  }
}
