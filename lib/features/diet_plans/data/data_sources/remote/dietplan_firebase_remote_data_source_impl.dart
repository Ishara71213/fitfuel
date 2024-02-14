import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/constants/firebase_collections.dart';
import 'dart:developer' as dev;

import 'package:fitfuel/features/diet_plans/data/data_sources/remote/dietplan_firebase_remote_data_source.dart';
import 'package:fitfuel/features/diet_plans/data/models/dietplan_model.dart';
import 'package:fitfuel/features/diet_plans/domain/entities/diet_plan_entity.dart';

class DietPlanFirebaseRemoteDataSourceImpl
    implements DietPlansFirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  DietPlanFirebaseRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<DietPlanEntity>> getAllDietPlans() async {
    CollectionReference dietPlansCollectionRef =
        firestore.collection(FirebaseCollections.dietPlans);
    try {
      QuerySnapshot querySnapshot = await dietPlansCollectionRef.get();
      List<DietPlanModel> dietPlanList = querySnapshot.docs.map((doc) {
        return DietPlanModel.fromSnapshot(doc);
      }).toList();

      return dietPlanList;
    } catch (e) {
      dev.log(e.toString(), name: "ERROR Error fetching clubs");
      throw Exception('Failed to fetch clubs');
    }
  }
}
