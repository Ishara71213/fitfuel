part of 'filter_plan_cubit.dart';

class DietPlanState extends Equatable {
  const DietPlanState();

  @override
  List<Object?> get props => [];
}

class DietPlanInitial extends DietPlanState {}

class AgeRangeUpdated extends DietPlanState {
  final AgeRange selectedAgeRange;

  const AgeRangeUpdated(this.selectedAgeRange);

  @override
  List<Object?> get props => [selectedAgeRange];
}

class WeightRangeUpdated extends DietPlanState {
  final WeightRange selectedWeightRange;

  const WeightRangeUpdated(this.selectedWeightRange);

  @override
  List<Object?> get props => [selectedWeightRange];
}

class DietTypeUpdated extends DietPlanState {
  final DietType selectedDietType;

  const DietTypeUpdated(this.selectedDietType);

  @override
  List<Object?> get props => [selectedDietType];
}
