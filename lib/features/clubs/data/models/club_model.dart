import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/utils/cordinates.dart';
import 'package:fitfuel/core/utils/subscriptions_plans.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

class ClubModel extends ClubEntity {
  const ClubModel({
    required String clubName,
    required String address,
    required String closeTime,
    required Cordinates clubCoordinates,
    required int maxMembersAtTime,
    required int currentMembers,
    required List<String> images,
    required String openTime,
    required List<SubscriptionPlans> subscriptionPlans,
  }) : super(
          address: address,
          closeTime: closeTime,
          clubCoordinates: clubCoordinates,
          clubName: clubName,
          maxMembersAtTime: maxMembersAtTime,
          currentMembers: currentMembers,
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
      maxMembersAtTime: documentSnapshot.get("maxMembersAtTime"),
      currentMembers: documentSnapshot.get("currentMembers"),
      images: List<String>.from(documentSnapshot.get("images")),
      openTime: documentSnapshot.get("openTime"),
      subscriptionPlans: List<SubscriptionPlans>.from(
        (documentSnapshot.get("subscriptionPlans") as List<dynamic>).map(
          (plan) => SubscriptionPlans(
            planName: plan["planName"],
            price: plan["price"],
            duration: plan["duration"],
          ),
        ),
      ),
    );
  }

  // Convert to Firebase document
  Map<String, dynamic> toDocument() {
    return {
      "clubName": clubName,
      "address": address,
      "closeTime": closeTime,
      "openTime": openTime,
      "clubCordinates": {
        "latitude": clubCoordinates.latitude,
        "longitude": clubCoordinates.longitude,
      },
      "maxMembersAtTime": maxMembersAtTime,
      "currentMembers": currentMembers,
      "images": images,
      "subscriptionPlans": List<Map<String, dynamic>>.from(
        subscriptionPlans.map(
          (plan) => {
            "planName": plan.planName,
            "price": plan.price,
            "duration": plan.duration,
          },
        ),
      ),
    };
  }

  ClubEntity toEntity() {
    return ClubEntity(
      address: address,
      closeTime: closeTime,
      clubCoordinates: clubCoordinates,
      clubName: clubName,
      maxMembersAtTime: maxMembersAtTime,
      currentMembers: currentMembers,
      images: images,
      openTime: openTime,
      subscriptionPlans: subscriptionPlans,
    );
  }
}
