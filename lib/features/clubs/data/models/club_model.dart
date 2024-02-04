import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/utils/cordinates.dart';
import 'package:fitfuel/core/utils/subscriptions_plans.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

class ClubModel extends ClubEntity {
  const ClubModel({
    required String address,
    required String closeTime,
    required Cordinates clubCoordinates,
    required String clubName,
    required List<String> images,
    required String openTime,
    required SubscriptionPlans subscriptionPlans,
  }) : super(
          address: address,
          closeTime: closeTime,
          clubCoordinates: clubCoordinates,
          clubName: clubName,
          images: images,
          openTime: openTime,
          subscriptionPlans: subscriptionPlans,
        );

  // Convert to ClubModel from Firebase document
  factory ClubModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return ClubModel(
      address: documentSnapshot.get("address"),
      closeTime: documentSnapshot.get("closeTime"),
      clubCoordinates: Cordinates(
        latitude: documentSnapshot.get("clubCordinates.latitude"),
        longitude: documentSnapshot.get("clubCordinates.longitude"),
      ),
      clubName: documentSnapshot.get("clubName"),
      images: List<String>.from(documentSnapshot.get("images")),
      openTime: documentSnapshot.get("openTime"),
      subscriptionPlans: SubscriptionPlans(
        planName: documentSnapshot.get("subscriptionPlans.planName"),
        price: documentSnapshot.get("subscriptionPlans.price"),
        duration: documentSnapshot.get("subscriptionPlans.duration"),
      ),
    );
  }

  // Convert to Firebase document
  Map<String, dynamic> toDocument() {
    return {
      "address": address,
      "closeTime": closeTime,
      "clubCordinates": {
        "latitude": clubCoordinates.latitude,
        "longitude": clubCoordinates.longitude,
      },
      "clubName": clubName,
      "images": images,
      "openTime": openTime,
      "subscriptionPlans": {
        "planName": subscriptionPlans.planName,
        "price": subscriptionPlans.price,
        "duration": subscriptionPlans.duration,
      },
    };
  }

  ClubEntity toEntity() {
    return ClubEntity(
      address: address,
      closeTime: closeTime,
      clubCoordinates: clubCoordinates,
      clubName: clubName,
      images: images,
      openTime: openTime,
      subscriptionPlans: subscriptionPlans,
    );
  }
}
