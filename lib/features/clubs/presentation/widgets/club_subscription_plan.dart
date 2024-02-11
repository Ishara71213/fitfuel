import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/utils/subscriptions_plans.dart';
import 'package:flutter/material.dart';

class ClubSubscriptionPlan extends StatelessWidget {
  const ClubSubscriptionPlan({
    super.key,
    required this.clubSubscriptionPlan,
  });

  final SubscriptionPlans clubSubscriptionPlan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${clubSubscriptionPlan.planName} Subscription",
                style: kInputFieldText,
              ),
              Text(
                "${clubSubscriptionPlan.price}LKR",
                style: kInputFieldText,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Free ${clubSubscriptionPlan.duration} Diet plans",
                style: kGreySmallesttextStyle,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Free ${clubSubscriptionPlan.duration} Schedule",
                style: kGreySmallesttextStyle,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
