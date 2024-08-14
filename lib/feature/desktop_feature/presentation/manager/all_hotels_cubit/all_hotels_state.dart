part of 'all_hotels_cubit.dart';

@immutable
sealed class AllHotelsState {}

final class AllHotelsInitial extends AllHotelsState {}

final class AllHotelsLoading extends AllHotelsState {}

final class AllHotelsSuccess extends AllHotelsState {
  final AllHotelsModel allHotelsModel;

  AllHotelsSuccess({required this.allHotelsModel});
}

final class AllHotelsFailure extends AllHotelsState {
  final String errMessage;

  AllHotelsFailure({required this.errMessage});
}
