import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego_dashboard/core/domain/services/api_imp.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo_impl.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/hotel_deatails.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/hotel_grid_card.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/manager/all_hotels_cubit/all_hotels_cubit.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/manager/hotel_details_cubit/hotel_details_cubit_cubit.dart';

class HotelsGridView extends StatelessWidget {
  const HotelsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllHotelsCubit(DesktopRepoImpl(api: ApiServicesImp(Dio())))
            ..fetchAllHotelsFun(),
      child: BlocBuilder<AllHotelsCubit, AllHotelsState>(
        builder: (context, state) {
          if (state is AllHotelsSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: state.allHotelsModel.body!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<HotelDetailsCubitCubit>(context)
                        .fetchHotelDetailsFun(
                            id: state.allHotelsModel.body![index].hotelId!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelDetailsPage(),
                      ),
                    );
                  },
                  child: HotelGridCard(
                    image: 'assets/images/download (2).jpeg',
                    name: state.allHotelsModel.body![index].hotelName!,
                    location: state.allHotelsModel.body![index].cityName!,
                  ),
                );
              },
            );
          }
          if (state is AllHotelsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AllHotelsFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return Center(
              child: Text('there was an error'),
            );
          }
        },
      ),
    );
  }
}
