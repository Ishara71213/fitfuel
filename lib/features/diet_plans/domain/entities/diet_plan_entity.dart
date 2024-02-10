import 'package:equatable/equatable.dart';

class DietPlanEntity extends Equatable {
  final String ageRange;
  final String weightRange;
  final String dietType;
  final String description;
  final Map<String, List<Map<String, dynamic>>> meals;

  const DietPlanEntity({
    required this.ageRange,
    required this.weightRange,
    required this.dietType,
    required this.description,
    required this.meals,
  });

  @override
  List<Object?> get props =>
      [ageRange, weightRange, dietType, description, meals];
}
