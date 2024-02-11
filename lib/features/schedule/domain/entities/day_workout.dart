import 'package:fitfuel/features/schedule/domain/entities/workout.dart';

class DayWorkOut {
  final List<WorkOut>? exercises;
  final String? type;

  DayWorkOut({required this.exercises, required this.type});

  factory DayWorkOut.fromJson(Map<String, dynamic> json) {
    return DayWorkOut(
      exercises: json['exercises'] != null
          ? List<WorkOut>.from(
              (json['exercises'] as List<dynamic>).map(
                (exercise) => WorkOut.fromJson(exercise),
              ),
            )
          : null,
      type: json['workoutType'],
    );
  }
}
