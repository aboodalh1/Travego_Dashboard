import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego_dashboard/core/domain/services/api_imp.dart';
import 'package:travego_dashboard/feature/desktop_feature/data/repos/desktop_repo_impl.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/booking_card.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/manager/trips_with_status_cubit/trips_with_status_cubit.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Up Coming Trip',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: BlocProvider(
                create: (context) => TripsWithStatusCubit(
                    DesktopRepoImpl(api: ApiServicesImp(Dio())))
                  ..fetchTripsWithStatusFun(status: "Available"),
                child: BlocBuilder<TripsWithStatusCubit, TripsWithStatusState>(
                  builder: (context, state) {
                    if (state is TripsWithStatusSuccess) {
                      return ListView.builder(
                        itemCount: state.tripsWithStatusModel.body!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BookingCard(
                            destination: state
                                .tripsWithStatusModel.body![index].tripName!,
                            nights: calculateDateDifferenceInDays(
                                state.tripsWithStatusModel.body![index]
                                    .tripStartDate!,
                                (state.tripsWithStatusModel.body![index]
                                    .tripEndDate!)),
                            location: state
                                .tripsWithStatusModel.body![index].country!,
                            date: state.tripsWithStatusModel.body![index]
                                .tripStartDate!
                                .substring(0, 10),
                            adjustments: state.tripsWithStatusModel.body![index]
                                .tripCategory!,
                            price: state
                                .tripsWithStatusModel.body![index].price!
                                .toDouble(),
                            imagePath: 'assets/images/12 (1).jpeg',
                          );
                        },
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate the difference in days between two dates
  int calculateDateDifferenceInDays(String startDateStr, String endDateStr) {
    DateTime startDate = DateTime.parse(startDateStr);
    DateTime endDate = DateTime.parse(endDateStr);

    Duration difference = endDate.difference(startDate);

    return difference.inDays;
  }

  void main() {
    String startDate = "2024-08-01";
    String endDate = "2024-08-10";

    int dateDifferenceInDays =
        calculateDateDifferenceInDays(startDate, endDate);
    print(dateDifferenceInDays); // Output: 9
  }
}
