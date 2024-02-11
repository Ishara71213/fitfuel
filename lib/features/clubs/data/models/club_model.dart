import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/utils/cordinates.dart';
import 'package:fitfuel/core/utils/subscriptions_plans.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

class ClubModel extends ClubEntity {
  const ClubModel(
      {required String clubName,
      required String address,
      required String closeTime,
      required Cordinates clubCoordinates,
      required int maxMembersAtTime,
      required int currentMembers,
      required List<String> images,
      required String openTime,
      required List<SubscriptionPlans> subscriptionPlans,
      required bool isSaved})
      : super(
          address: address,
          closeTime: closeTime,
          clubCoordinates: clubCoordinates,
          clubName: clubName,
          maxMembersAtTime: maxMembersAtTime,
          currentMembers: currentMembers,
          images: images,
          openTime: openTime,
          subscriptionPlans: subscriptionPlans,
          isSaved: isSaved,
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
      isSaved: false,
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
      isSaved: isSaved,
    );
  }

  // Convert from entity to ClubModel
  static ClubModel fromEntity(ClubEntity entity) {
    return ClubModel(
      clubName: entity.clubName,
      address: entity.address,
      closeTime: entity.closeTime,
      openTime: entity.openTime,
      clubCoordinates: entity.clubCoordinates,
      maxMembersAtTime: entity.maxMembersAtTime,
      currentMembers: entity.currentMembers,
      images: entity.images,
      subscriptionPlans: entity.subscriptionPlans,
      isSaved: entity.isSaved,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'clubName': clubName,
      'address': address,
      'closeTime': closeTime,
      'openTime': openTime,
      'clubCordinates': jsonEncode(clubCoordinates.toJson()),
      'maxMembersAtTime': maxMembersAtTime,
      'currentMembers': currentMembers,
      'images': jsonEncode(images),
      'subscriptionPlans':
          jsonEncode(subscriptionPlans.map((plan) => plan.toJson()).toList()),
      'isSaved': isSaved,
    };
  }

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      clubName: json['clubName'],
      address: json['address'],
      closeTime: json['closeTime'],
      openTime: json['openTime'],
      clubCoordinates: Cordinates.fromJson(jsonDecode(json['clubCordinates'])),
      maxMembersAtTime: json['maxMembersAtTime'],
      currentMembers: json['currentMembers'],
      images: List<String>.from(jsonDecode(json['images'])),
      subscriptionPlans: List<SubscriptionPlans>.from(
        (jsonDecode(json['subscriptionPlans']) as List<dynamic>).map(
          (plan) => SubscriptionPlans.fromJson(plan),
        ),
      ),
      isSaved: json['isSaved'] == "true" ? true : false,
    );
  }

  ClubModel copyWith({
    String? address,
    String? closeTime,
    Cordinates? clubCoordinates,
    String? clubName,
    int? maxMembersAtTime,
    int? currentMembers,
    List<String>? images,
    String? openTime,
    SubscriptionPlans? subscriptionPlans,
    bool? isSaved,
  }) {
    return ClubModel(
      address: this.address,
      closeTime: this.closeTime,
      clubCoordinates: this.clubCoordinates,
      clubName: this.clubName,
      maxMembersAtTime: maxMembersAtTime ?? this.maxMembersAtTime,
      currentMembers: currentMembers ?? this.currentMembers,
      images: this.images,
      openTime: this.openTime,
      subscriptionPlans: this.subscriptionPlans,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
