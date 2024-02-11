import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/constants/firebase_collections.dart';
import 'package:fitfuel/features/schedule/data/data_sources/remote/schedule_firebase_remote_datasource.dart';
import 'package:fitfuel/features/schedule/data/model/schedule_model.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_entity.dart';
import 'dart:developer' as dev;

class ScheduleFirebaseRemoteDataSourceImpl
    implements ScheduleFirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  ScheduleFirebaseRemoteDataSourceImpl({required this.firestore});

  @override
  Future<ScheduleEntity> getSchedule() async {
    CollectionReference clubsCollectionRef =
        firestore.collection(FirebaseCollections.schedules);
    try {
      QuerySnapshot querySnapshot = await clubsCollectionRef.get();
      List<ScheduleEntity> schedule = querySnapshot.docs.map((doc) {
        return ScheduleModel.fromSnapshot(doc).toEntity();
      }).toList();

      return schedule.first;
    } catch (e) {
      dev.log(e.toString(), name: "ERROR Error fetching schedules");
      throw Exception('Failed to fetch Schedules');
    }
  }
}
