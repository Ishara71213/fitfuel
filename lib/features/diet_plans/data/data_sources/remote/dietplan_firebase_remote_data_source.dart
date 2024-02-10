import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';

abstract class DietPlansFirebaseRemoteDataSource {
  Future<List<DietPlanEntity>> getAllDietPlans();
}
