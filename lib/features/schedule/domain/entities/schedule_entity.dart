import 'package:equatable/equatable.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_levels.dart';

class ScheduleEntity extends Equatable {
  final ScheduleLevels advanced;
  final ScheduleLevels beginner;
  final ScheduleLevels elite;
  final ScheduleLevels expert;
  final ScheduleLevels intermediate;
  final bool isSaved;

  const ScheduleEntity({
    required this.advanced,
    required this.beginner,
    required this.elite,
    required this.expert,
    required this.intermediate,
    required this.isSaved,
  });

  @override
  List<Object?> get props => [
        advanced,
        beginner,
        elite,
        expert,
        intermediate,
        isSaved,
      ];
}
