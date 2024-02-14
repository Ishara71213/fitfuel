import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/constants/firebase_collections.dart';
import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source.dart';
import 'package:fitfuel/features/clubs/data/models/club_model.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'dart:developer' as dev;

class ClubsFirebaseRemoteDataSourceImpl
    implements ClubsFirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  ClubsFirebaseRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ClubEntity>> getAllClubs() async {
    CollectionReference clubsCollectionRef =
        firestore.collection(FirebaseCollections.clubs);
    try {
      QuerySnapshot querySnapshot = await clubsCollectionRef.get();
      List<ClubEntity> clubsList = querySnapshot.docs.map((doc) {
        return ClubModel.fromSnapshot(doc).toEntity();
      }).toList();

      return clubsList;
    } catch (e) {
      dev.log(e.toString(), name: "ERROR Error fetching clubs");
      throw Exception('Failed to fetch clubs');
    }
  }
}
