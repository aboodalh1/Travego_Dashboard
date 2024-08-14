import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego_dashboard/core/domain/services/api.dart';
import 'package:travego_dashboard/core/errors/failure.dart';
import 'package:travego_dashboard/core/utils/config.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/all_hotels_model/all_hotels_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/hotel_details_model/hotel_details_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/models/up_coming_model/up_coming_model.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo.dart';

class DesktopRepoImpl implements DesktopRepo {
  final ApiServices api;

  DesktopRepoImpl({required this.api});
  @override
  Future<Either<Failure, TripsWithStatusModel>> getTripsWithStatus(
      {required String status}) async {
    try {
      var response = await api.get(Confg.tripsWithStatusUrl,
          hasToken: true, queryParams: {'status': status});
      print(" $response");
      TripsWithStatusModel tripsWithStatusModel =
          TripsWithStatusModel.fromJson(response);
      return right(tripsWithStatusModel);
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllHotelsModel>> getAllHotels() async {
    try {
      var response = await api.get(
        Confg.allHotelsUrl,
        hasToken: true,
      );
      print(" $response");
      AllHotelsModel allHotelsModel = AllHotelsModel.fromJson(response);
      return right(allHotelsModel);
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HotelDetailsModel>> getHotelDetails(
      {required int id}) async {
    try {
      var response = await api.get(
        'v1/hotel_details/$id',
        hasToken: true,
      );
      print(" $response");
      HotelDetailsModel hotelDetailsModel =
          HotelDetailsModel.fromJson(response);
      return right(hotelDetailsModel);
    } catch (e) {
      print("faaaaaaaaaaaaaaleeeeeeeeeeeee");
      print(e.toString());
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
