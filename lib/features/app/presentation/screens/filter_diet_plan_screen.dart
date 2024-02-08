import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class FilterDietPlanScreen extends StatefulWidget {
  const FilterDietPlanScreen({super.key});

  @override
  State<FilterDietPlanScreen> createState() => _FilterDietPlanScreenState();
}

class _FilterDietPlanScreenState extends State<FilterDietPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarCustom(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20), // Add space before the TextField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Diet PLan Page',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Add more widgets here as needed
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
