part of 'diet_plan_cubit.dart';

sealed class DietPlanState extends Equatable {
  const DietPlanState();

  @override
  List<Object> get props => [];
}

final class DietPlanInitial extends DietPlanState {}
