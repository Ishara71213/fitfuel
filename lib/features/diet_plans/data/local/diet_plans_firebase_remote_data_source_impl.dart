// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fitfuel/features/diet_plans/data/local/diet_plans_firebase_remote_data_source.dart';

// class DietPlansFirebaseRemoteDataSourceImpl
//     implements DietPlansFirebaseRemoteDataSource {
//   final FirebaseAuth auth;
//   final FirebaseFirestore firestore;
//   DietPlansFirebaseRemoteDataSourceImpl(
//       {required this.auth, required this.firestore});

//   @override
//   Future<List<ClubEntity>> getAllClubs() async {
//     CollectionReference clubsCollectionRef = firestore.collection('clubs');
//     try {
//       QuerySnapshot querySnapshot = await clubsCollectionRef.get();
//       List<ClubModel> clubsList = querySnapshot.docs.map((doc) {
//         return ClubModel.fromSnapshot(doc);
//       }).toList();

//       return clubsList;
//     } catch (e) {
//       dev.log(e.toString(), name: "ERROR Error fetching clubs");
//       throw Exception('Failed to fetch clubs');
//     }
//   }
// }
