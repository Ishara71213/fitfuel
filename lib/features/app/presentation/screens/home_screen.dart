import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
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
