import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:flutter/material.dart';

class FitFuelSubscriptionBanner extends StatelessWidget {
  const FitFuelSubscriptionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHandler.navigate(context, RouteConst.subscriptionScreen);
      },
      child: Container(
        color: DarkTheme.kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Buy Fit Fuel Membership",
                        style: kInputFieldText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Free Diet plan for every Month",
                        style: kGreySmallesttextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Free Schedule for every Month",
                        style: kGreySmallesttextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Access All Fit Fuel Partner Gyms",
                        style: kGreySmallesttextStyle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "4000 LKR",
                    style: kInputFieldText,
                  ),
                  Text(
                    "Per Month",
                    style: kSmalltextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
