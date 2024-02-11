import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_entity.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_levels.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
    required ScheduleLevels advanced,
    required ScheduleLevels beginner,
    required ScheduleLevels elite,
    required ScheduleLevels expert,
    required ScheduleLevels intermediate,
    required bool isSaved,
  }) : super(
          advanced: advanced,
          beginner: beginner,
          elite: elite,
          expert: expert,
          intermediate: intermediate,
          isSaved: isSaved,
        );

  // Convert to ScheduleModel from Firebase document
  factory ScheduleModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return ScheduleModel(
      advanced: ScheduleLevels.fromJson(documentSnapshot.get("Advanced")),
      beginner: ScheduleLevels.fromJson(documentSnapshot.get("Beginner")),
      elite: ScheduleLevels.fromJson(documentSnapshot.get("Elite")),
      expert: ScheduleLevels.fromJson(documentSnapshot.get("Expert")),
      intermediate:
          ScheduleLevels.fromJson(documentSnapshot.get("Intermediate")),
      isSaved: false,
    );
  }

  // Convert from entity to ScheduleModel
  static ScheduleModel fromEntity(ScheduleEntity entity) {
    return ScheduleModel(
      advanced: entity.advanced,
      beginner: entity.beginner,
      elite: entity.elite,
      expert: entity.expert,
      intermediate: entity.intermediate,
      isSaved: entity.isSaved,
    );
  }

  // Convert to ScheduleEntity
  ScheduleEntity toEntity() {
    return ScheduleEntity(
      advanced: advanced,
      beginner: beginner,
      elite: elite,
      expert: expert,
      intermediate: intermediate,
      isSaved: isSaved,
    );
  }
}
