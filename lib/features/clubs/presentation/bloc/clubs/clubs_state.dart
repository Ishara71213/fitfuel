part of 'clubs_cubit.dart';

sealed class ClubsState extends Equatable {
  const ClubsState();

  @override
  List<Object> get props => [];
}

final class ClubsInitial extends ClubsState {}

final class ClubLoading extends ClubsState {}

final class ClubLoadingFailed extends ClubsState {}

final class ClubLoadingSuccess extends ClubsState {}

class LocationDataGathering extends ClubsState {
  final LatLng curruntLocation;
  const LocationDataGathering({this.curruntLocation = const LatLng(0, 0)});
  @override
  List<Object> get props => [curruntLocation];
}
