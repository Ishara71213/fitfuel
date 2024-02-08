import 'package:flutter/material.dart';
import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/core/widgets_library/button_widgets/button_widgets_library.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({Key? key}) : super(key: key);

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarCustom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: PageRedirectButtonCustom(
                      buttonText: 'Find a Plan',
                      leftIconData: Icons.search,
                      onPressed: () {
                        NavigationHandler.navigate(
                            context, RouteConst.filterDietPlanScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DarkTheme.kErrorColor,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
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
