import 'package:fitfuel/features/schedule/data/data_sources/remote/schedule_firebase_remote_datasource.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_entity.dart';
import 'package:fitfuel/features/schedule/domain/repository/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleFirebaseRemoteDataSource remoteDataSource;
  ScheduleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ScheduleEntity> getSchedule() async =>
      await remoteDataSource.getSchedule();
}
