class WorkOut {
  final String? exercise;
  final int? reps;
  final int? sets;

  WorkOut({required this.exercise, required this.reps, required this.sets});

  factory WorkOut.fromJson(Map<String, dynamic> json) {
    return WorkOut(
      exercise: json['exercise'],
      reps: json['reps'],
      sets: json['sets'],
    );
  }
}
