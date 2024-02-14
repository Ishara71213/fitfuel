import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';

abstract class DietPlanRepository {
  Future<List<DietPlanEntity>> getAllDietPlans();
}
