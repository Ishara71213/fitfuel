import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';

class DietPlanModel extends DietPlanEntity {
  const DietPlanModel({
    required String ageRange,
    required String weightRange,
    required String dietType,
    required String description,
    required Map<String, List<dynamic>> meals,
  }) : super(
          ageRange: ageRange,
          weightRange: weightRange,
          dietType: dietType,
          description: description,
          meals: meals,
        );

  // Convert to DietPlanModel from Firebase document
  factory DietPlanModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return DietPlanModel(
      ageRange: documentSnapshot.get("ageRange"),
      weightRange: documentSnapshot.get("weightRange"),
      dietType: documentSnapshot.get("dietType"),
      description: documentSnapshot.get("description"),
      meals: Map<String, List<dynamic>>.from(documentSnapshot.get("meals")),
    );
  }

  // Convert to Firebase document
  Map<String, dynamic> toDocument() {
    return {
      "ageRange": ageRange,
      "weightRange": weightRange,
      "dietType": dietType,
      "description": description,
      "meals": meals,
    };
  }

  DietPlanEntity toEntity() {
    return DietPlanEntity(
      ageRange: ageRange,
      weightRange: weightRange,
      dietType: dietType,
      description: description,
      meals: meals,
    );
  }
}
