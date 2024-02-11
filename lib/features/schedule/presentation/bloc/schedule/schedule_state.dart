part of 'schedule_cubit.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

final class ScheduleInitial extends ScheduleState {}

final class ScheduleLoading extends ScheduleState {}

final class ScheduleLoadingSucsess extends ScheduleState {}

final class ScheduleLoadingFailed extends ScheduleState {}
