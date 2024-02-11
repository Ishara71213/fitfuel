import 'package:fitfuel/features/schedule/domain/entities/day_workout.dart';

class ScheduleLevels {
  final DayWorkOut? day1;
  final DayWorkOut? day2;
  final DayWorkOut? day3;
  final DayWorkOut? day4;
  final DayWorkOut? day5;
  final DayWorkOut? day6;
  final DayWorkOut? day7;
  final String description;

  const ScheduleLevels({
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
    required this.description,
  });

  factory ScheduleLevels.fromJson(Map<String, dynamic> json) {
    return ScheduleLevels(
      day1: json.containsKey('day1') ? DayWorkOut.fromJson(json['day1']) : null,
      day2: json.containsKey('day2') ? DayWorkOut.fromJson(json['day2']) : null,
      day3: json.containsKey('day3') ? DayWorkOut.fromJson(json['day3']) : null,
      day4: json.containsKey('day4') ? DayWorkOut.fromJson(json['day4']) : null,
      day5: json.containsKey('day5') ? DayWorkOut.fromJson(json['day5']) : null,
      day6: json.containsKey('day6') ? DayWorkOut.fromJson(json['day6']) : null,
      day7: json.containsKey('day7') ? DayWorkOut.fromJson(json['day7']) : null,
      description: json['description'],
    );
  }
}
