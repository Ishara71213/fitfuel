import 'package:flutter/material.dart';
import 'package:fitfuel/core/components/app_bar_without_back_btn.dart';
import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/core/widgets_library/button_widgets/button_widgets_library.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/enums/diet_plan.dart';
import 'package:google_fonts/google_fonts.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({Key? key}) : super(key: key);

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  DietType? _selectedDietType;
  AgeRange? _selectedAgeRange;
  WeightRange? _selectedWeightRange;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithoutBackBtn(title: 'My Diet Plan'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
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
              if (_selectedDietType == null &&
                  _selectedAgeRange == null &&
                  _selectedWeightRange == null)
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: DarkTheme.kAppBgMediumShade,
                        margin: const EdgeInsets.only(
                            bottom: 10, top: 20, right: 8, left: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Diet Type: Weight Loss',
                                // 'Diet Type: ${_selectedDietType.toString().split('.').last}',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: DarkTheme.kDarkGreyShade,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Age: Under 25',
                                // 'Age: ${_selectedAgeRange.toString().split('.').last}',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: DarkTheme.kDarkGreyShade,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Weight: Under 45Kg',
                                // 'Weight: ${_selectedWeightRange.toString().split('.').last}',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: DarkTheme.kDarkGreyShade,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: DarkTheme.kAppBgMediumShade,
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      'Find Your Options',
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: DarkTheme.kPeoBlackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 80,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showPopUp(context, 'Breakfast');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFB74D),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Breakfast',
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: DarkTheme.kWhiteColor,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Icon(
                                        Icons.double_arrow,
                                        color: DarkTheme.kWhiteColor,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 80,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showPopUp(context, 'Lunch');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 67, 231, 75),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Lunch',
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: DarkTheme.kWhiteColor,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Icon(
                                        Icons.double_arrow,
                                        color: DarkTheme.kWhiteColor,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 80,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showPopUp(context, 'Dinner');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 55, 79, 214),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dinner',
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: DarkTheme.kWhiteColor,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Icon(
                                        Icons.double_arrow,
                                        color: DarkTheme.kWhiteColor,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: DarkTheme.kAppBgMediumShade,
                    margin: const EdgeInsets.only(
                        bottom: 10, top: 20, right: 8, left: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 25),
                          Text(
                            '-no diet plan selected-',
                            // 'Diet Type: ${_selectedDietType.toString().split('.').last}',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: DarkTheme.kDarkGreyShade,
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
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

  void _showPopUp(BuildContext context, String mealType) {
    List<Map<String, dynamic>> meals = [];

    if (mealType == 'Breakfast') {
      meals = [
        {
          "mealType": "Vegan",
          "foodName": "Fruit Smoothie",
          "quantity": "1 serving",
          "calories": 250
        },
        {
          "mealType": "Vegetarian",
          "foodName": "Whole Grain Toast with Avocado",
          "quantity": "2 slices",
          "calories": 300
        },
        {
          "mealType": "Omnivore",
          "foodName": "Scrambled Eggs with Spinach",
          "quantity": "2 eggs",
          "calories": 350
        }
      ];
    } else if (mealType == 'Lunch') {
      meals = [
        {
          "mealType": "Vegan",
          "foodName": "Quinoa Salad with Mixed Veggies",
          "quantity": "1 bowl",
          "calories": 400
        },
        {
          "mealType": "Vegetarian",
          "foodName": "Chickpea and Vegetable Wrap",
          "quantity": "1 wrap",
          "calories": 450
        },
        {
          "mealType": "Omnivore",
          "foodName": "Grilled Chicken Salad",
          "quantity": "1 plate",
          "calories": 500
        }
      ];
    } else if (mealType == 'Dinner') {
      meals = [
        {
          "mealType": "Vegan",
          "foodName": "Roasted Vegetable and Lentil Stew",
          "quantity": "1 serving",
          "calories": 450
        },
        {
          "mealType": "Vegetarian",
          "foodName": "Vegetable Stir-Fry with Tofu",
          "quantity": "1 serving",
          "calories": 500
        },
        {
          "mealType": "Omnivore",
          "foodName": "Salmon with Quinoa and Asparagus",
          "quantity": "1 serving",
          "calories": 550
        }
      ];
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$mealType Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var meal in meals)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'For ${meal['mealType']} Meal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('${meal['quantity']} of ${meal['foodName']}'),
                    // Text('Quantity: ${meal['quantity']}'),
                    Text('Calories: ${meal['calories']}'),
                    const Divider(),
                  ],
                ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: DarkTheme.kErrorColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
