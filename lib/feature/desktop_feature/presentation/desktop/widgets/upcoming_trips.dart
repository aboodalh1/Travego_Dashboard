import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego_dashboard/core/domain/services/api_imp.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo_impl.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/trip_card.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/manager/trips_with_status_cubit/trips_with_status_cubit.dart';

class UpcomingTrips extends StatelessWidget {
  const UpcomingTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Booking History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            BlocProvider(
              create: (context) => TripsWithStatusCubit(
                  DesktopRepoImpl(api: ApiServicesImp(Dio())))
                ..fetchTripsWithStatusFun(status: 'Finished'),
              child: BlocBuilder<TripsWithStatusCubit, TripsWithStatusState>(
                builder: (context, state) {
                  if (state is TripsWithStatusSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.tripsWithStatusModel.body!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TripCard(
                            destination: state
                                .tripsWithStatusModel.body![index].country!,
                            startDate: state.tripsWithStatusModel.body![index]
                                .tripStartDate!
                                .substring(1, 10),
                            description: state.tripsWithStatusModel.body![index]
                                .tripDescription!,
                          );
                        },
                      ),
                    );
                  }
                  if (state is TripsWithStatusLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TripsWithStatusFailure) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else {
                    return Center(
                      child: Text('There is an error '),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
