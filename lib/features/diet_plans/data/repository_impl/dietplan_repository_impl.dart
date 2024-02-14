import 'package:fitfuel/features/diet_plans/data/data_sources/remote/dietplan_firebase_remote_data_source.dart';
import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';
import 'package:fitfuel/features/diet_plans/domain/repository/dietplan_repository.dart';

class DetPlanRepositoryImpl implements DietPlanRepository {
  DietPlansFirebaseRemoteDataSource remoteDataSource;
  DetPlanRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<DietPlanEntity>> getAllDietPlans() async =>
      await remoteDataSource.getAllDietPlans();
}
