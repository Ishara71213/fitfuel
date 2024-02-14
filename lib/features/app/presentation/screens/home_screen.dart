import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/components/fit_fuel_subscription_banner.dart';
import 'package:fitfuel/core/enums/states.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarCustom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const FitFuelSubscriptionBanner(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Fit Fuel's subscription offers access to a network of partner gyms, providing a cost-effective and flexible fitness solution. With one subscription, users enjoy diverse workouts at different facilities. Fit Fuel promotes an engaging fitness journey, ideal for those seeking variety and convenience in workouts.",
                      style: kGreySmallBodytextStyle,
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Why Fit Fuel",
                      style: kTitlText,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Enjoy workouts at various partner gyms with a single subscription.",
                      style: kGreySmallBodytextStyle,
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Manage subscriptions effortlessly through our intuitive app.",
                      style: kGreySmallBodytextStyle,
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Discover different gyms, classes, and fitness environments seamlessly.",
                      style: kGreySmallBodytextStyle,
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Experience diverse workouts without multiple individual memberships.",
                      style: kGreySmallBodytextStyle,
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: FilledButtonWithLoader(
                  initText: 'Get Started',
                  onPressed: () {
                    NavigationHandler.navigate(
                        context, RouteConst.subscriptionScreen);
                  },
                  state: States.initial,
                ),
              ),
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
