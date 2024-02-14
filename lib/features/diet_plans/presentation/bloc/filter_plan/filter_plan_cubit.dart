import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfuel/core/enums/diet_plan.dart';

part 'filter_plan_state.dart';

class DietPlanFilterCubit extends Cubit<DietPlanFilterState> {
  DietPlanFilterCubit() : super(DietPlanInitial());

  void updateAgeRange(AgeRange selectedAgeRange) {
    emit(AgeRangeUpdated(selectedAgeRange));
  }

  void updateWeightRange(WeightRange selectedWeightRange) {
    emit(WeightRangeUpdated(selectedWeightRange));
  }

  void updateDietType(DietType selectedDietType) {
    emit(DietTypeUpdated(selectedDietType));
  }
}
