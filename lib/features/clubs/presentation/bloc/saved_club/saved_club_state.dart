part of 'saved_club_cubit.dart';

sealed class SavedClubState extends Equatable {
  const SavedClubState();

  @override
  List<Object> get props => [];
}

final class SavedClubInitial extends SavedClubState {}

final class SavedClubLoading extends SavedClubState {}

final class SavedClubLodaingSuccess extends SavedClubState {}
