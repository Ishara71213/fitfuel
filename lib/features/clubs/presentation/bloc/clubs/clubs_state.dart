part of 'clubs_cubit.dart';

sealed class ClubsState extends Equatable {
  const ClubsState();

  @override
  List<Object> get props => [];
}

final class ClubsInitial extends ClubsState {}

final class FilterClubs extends ClubsState {}

final class ClubLoading extends ClubsState {}

final class ClubLoadingFailed extends ClubsState {}

final class ClubLoadingSuccess extends ClubsState {}

class LocationDataGathering extends ClubsState {}

final class ToggleFilter extends ClubsState {}
