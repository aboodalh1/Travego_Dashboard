

import 'package:bloc/bloc.dart';
import 'package:travego_dashboard/feature/trip/data/models/city_model.dart';
import 'package:travego_dashboard/feature/trip/data/models/country_model.dart';
import 'package:travego_dashboard/feature/trip/data/models/hotel_model.dart';
import 'package:travego_dashboard/feature/trip/data/models/services_model.dart';
import 'package:travego_dashboard/feature/trip/data/repo/trip_repo.dart';

import 'services_state.dart';


class ServicesCubit extends Cubit<ServicesState> {
  final TripRepo destinationRepo;
   List<ServiceModel> hotels=[];
  ServicesCubit( this.destinationRepo) : super(ServicesInitial());

  Future<void> fetchAllServices() async {
    print("staaaaaaaaat");
    emit(ServicesLoading());

    var result = await destinationRepo.getServices();
    result.fold(
          (failure)
          {
            print(failure.errMessage);

            emit(ServicesFailure(failure.errMessage));
            },
          (success) async {
            print("Succcesssssssss");
                    hotels=success.services;
        emit(ServicesSuccess(success.services));

      },
    );
  }


}
