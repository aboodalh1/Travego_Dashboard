part of 'trips_with_status_cubit.dart';

@immutable
sealed class TripsWithStatusState {}

final class TripsWithStatusInitial extends TripsWithStatusState {}

final class TripsWithStatusLoading extends TripsWithStatusState {}

final class TripsWithStatusSuccess extends TripsWithStatusState {
  final TripsWithStatusModel tripsWithStatusModel;

  TripsWithStatusSuccess({required this.tripsWithStatusModel});
}

final class TripsWithStatusFailure extends TripsWithStatusState {
  final String errMessage;

  TripsWithStatusFailure({required this.errMessage});
}
