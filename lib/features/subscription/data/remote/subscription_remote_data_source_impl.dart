import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/core/constants/firebase_collections.dart';
import 'package:fitfuel/features/auth/data/models/user_model.dart';
import 'package:fitfuel/features/clubs/data/models/club_model.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'dart:developer' as dev;

import 'package:fitfuel/features/subscription/data/remote/subscription_remote_data_source.dart';

class SubscriptionRemoteDataSourceImpl implements SubscriptionRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  SubscriptionRemoteDataSourceImpl(
      {required this.auth, required this.firestore});

  @override
  Future<UserEntity> subscribe(UserEntity entity) async {
    CollectionReference userCollectionRef =
        firestore.collection(FirebaseCollections.users);
    try {
      String? uid = auth.currentUser?.uid;

      late UserEntity currentUser;

      await userCollectionRef.doc(uid).get().then((value) {
        if (value.exists) {
          UserModel existingUser = UserModel.fromSnapshot(value);
          final userData = existingUser.copyWith(
            isSubscribed: true,
            currentSubscription: entity.currentSubscription,
          );
          currentUser = userData.toEntity();
          final payload = userData.toDocument();
          userCollectionRef.doc(uid).set(payload);
        }
      });
      return currentUser;
    } catch (e) {
      dev.log(e.toString(), name: "ERROR  Subscribe");
      throw Exception('Failed to Subscribe');
    }
  }
}
