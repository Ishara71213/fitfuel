import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/components/fit_fuel_subscription_banner.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(
          title: "Subscribe",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const FitFuelSubscriptionBanner(),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Fit Fuel's subscription offers access to a network of partner gyms, providing a cost-effective and flexible fitness solution. With one subscription, users enjoy diverse workouts at different facilities. Fit Fuel promotes an engaging fitness journey, ideal for those seeking variety and convenience in workouts.",
                    style: kGreySmalltextStyle,
                  )),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
