import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fitfuel/core/utils/cordinates.dart';
// import 'package:fitfuel/core/utils/subscriptions_plans.dart';
// import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

class GymScheduleModel {
  final String level;
  final String description;
  final Map<String, dynamic> day1;
  final Map<String, dynamic> day2;
  final Map<String, dynamic> day3;
  final Map<String, dynamic> day4;
  final Map<String, dynamic>? day5;
  final Map<String, dynamic>? day6;
  final Map<String, dynamic>? day7;

  GymScheduleModel({
    required this.level,
    required this.description,
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    this.day5,
    this.day6,
    this.day7,
  });

  factory GymScheduleModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return GymScheduleModel(
      level: documentSnapshot.get("level"),
      description: documentSnapshot.get("description"),
      day1: Map<String, dynamic>.from(documentSnapshot.get("day1")),
      day2: Map<String, dynamic>.from(documentSnapshot.get("day2")),
      day3: Map<String, dynamic>.from(documentSnapshot.get("day3")),
      day4: Map<String, dynamic>.from(documentSnapshot.get("day4")),
      day5: documentSnapshot.get("day5") != null
          ? Map<String, dynamic>.from(documentSnapshot.get("day5"))
          : null,
      day6: documentSnapshot.get("day6") != null
          ? Map<String, dynamic>.from(documentSnapshot.get("day6"))
          : null,
      day7: documentSnapshot.get("day7") != null
          ? Map<String, dynamic>.from(documentSnapshot.get("day7"))
          : null,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "level": level,
      "description": description,
      "day1": day1,
      "day2": day2,
      "day3": day3,
      "day4": day4,
      "day5": day5,
      "day6": day6,
      "day7": day7,
    };
  }
}
