import 'package:equatable/equatable.dart';
import 'package:fitfuel/core/utils/cordinates.dart';
import 'package:fitfuel/core/utils/subscriptions_plans.dart';

class ClubEntity extends Equatable {
  final String address;
  final String closeTime;
  final Cordinates clubCoordinates;
  final String clubName;
  final int maxMembersAtTime;
  final int currentMembers;
  final List<String> images;
  final String openTime;
  final List<SubscriptionPlans> subscriptionPlans;
  final bool isSaved;

  const ClubEntity(
      {required this.address,
      required this.closeTime,
      required this.clubCoordinates,
      required this.clubName,
      required this.maxMembersAtTime,
      required this.currentMembers,
      required this.images,
      required this.openTime,
      required this.subscriptionPlans,
      required this.isSaved});

  @override
  List<Object?> get props => [
        address,
        closeTime,
        clubCoordinates,
        clubName,
        maxMembersAtTime,
        currentMembers,
        images,
        openTime,
        subscriptionPlans,
        isSaved
      ];
}
