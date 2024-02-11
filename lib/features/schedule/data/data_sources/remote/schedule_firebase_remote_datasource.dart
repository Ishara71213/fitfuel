import 'package:fitfuel/features/schedule/domain/entities/schedule_entity.dart';

abstract class ScheduleFirebaseRemoteDataSource {
  Future<ScheduleEntity> getSchedule();
}
