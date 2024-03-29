import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';
import 'package:fitfuel/features/diet_plans/domain/usecases/get_all_clubs_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

part 'diet_plan_state.dart';

class DietPlanCubit extends Cubit<DietPlanState> {
  final GetAllDietPlansUsecase dietPlansUsecase;
  DietPlanCubit({required this.dietPlansUsecase}) : super(DietPlanInitial());

  List<DietPlanEntity> dietPlanList = [];
  List<DietPlanEntity> dietPlanListTemp = [];

  void filter(String? ageRange, String? weightRange, String? dietType) {
    emit(DietPlanSetFilter());
    dietPlanList = dietPlanListTemp
        .where((e) => ((e.ageRange == (ageRange ?? "")) ||
            (e.weightRange == (weightRange ?? "")) ||
            (e.dietType == (dietType ?? ""))))
        .toList();
    emit(DietPlanFilterSearch());
  }

  void clearFilter() {
    dietPlanList = dietPlanListTemp;
    emit(DietPlanInitial());
  }

  Future<List<DietPlanEntity>> getAllDietPlans() async {
    try {
      if (dietPlanList.isNotEmpty) {
        return dietPlanList;
      }
      dietPlanList = await dietPlansUsecase.call();
      dietPlanListTemp = dietPlanList;
    } on SocketException catch (e, s) {
      dev.log(e.toString(), name: "Error", stackTrace: s);
    } catch (e, s) {
      dev.log(e.toString(), name: "Error", stackTrace: s);
    }
    return dietPlanList;
  }
}
