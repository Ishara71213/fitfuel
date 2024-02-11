import 'package:fitfuel/features/schedule/domain/entities/schedule_entity.dart';
import 'package:fitfuel/features/schedule/domain/repository/schedule_repository.dart';

class GetScheduleUsecase {
  final ScheduleRepository _repository;
  GetScheduleUsecase({required ScheduleRepository repository})
      : _repository = repository;

  Future<ScheduleEntity> call() async {
    return await _repository.getSchedule();
  }
}
