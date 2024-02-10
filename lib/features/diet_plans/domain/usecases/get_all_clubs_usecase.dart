import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';
import 'package:fitfuel/features/diet_plans/domain/repository/dietplan_repository.dart';

class GetAllDietPlansUsecase {
  final DietPlanRepository _repository;
  GetAllDietPlansUsecase({required DietPlanRepository repository})
      : _repository = repository;

  Future<List<DietPlanEntity>> call() async {
    return await _repository.getAllDietPlans();
  }
}
