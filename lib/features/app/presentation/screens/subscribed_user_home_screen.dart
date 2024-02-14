import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class SubscribedUserHomeScreen extends StatefulWidget {
  const SubscribedUserHomeScreen({super.key});

  @override
  State<SubscribedUserHomeScreen> createState() =>
      _SubscribedUserHomeScreenState();
}

class _SubscribedUserHomeScreenState extends State<SubscribedUserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarCustom(),
        body: const SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
