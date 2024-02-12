part of 'filter_plan_cubit.dart';

class DietPlanFilterState extends Equatable {
  const DietPlanFilterState();

  @override
  List<Object?> get props => [];
}

class DietPlanInitial extends DietPlanFilterState {}

class AgeRangeUpdated extends DietPlanFilterState {
  final AgeRange selectedAgeRange;

  const AgeRangeUpdated(this.selectedAgeRange);

  @override
  List<Object?> get props => [selectedAgeRange];
}

class WeightRangeUpdated extends DietPlanFilterState {
  final WeightRange selectedWeightRange;

  const WeightRangeUpdated(this.selectedWeightRange);

  @override
  List<Object?> get props => [selectedWeightRange];
}

class DietTypeUpdated extends DietPlanFilterState {
  final DietType selectedDietType;

  const DietTypeUpdated(this.selectedDietType);

  @override
  List<Object?> get props => [selectedDietType];
}
