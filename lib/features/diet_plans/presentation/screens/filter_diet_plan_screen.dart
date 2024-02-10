import 'package:fitfuel/core/enums/diet_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/features/diet_plans/presentation/bloc/filter_plan/filter_plan_cubit.dart';

class FilterDietPlanScreen extends StatefulWidget {
  const FilterDietPlanScreen({Key? key}) : super(key: key);

  @override
  State<FilterDietPlanScreen> createState() => _FilterDietPlanScreenState();
}

class _FilterDietPlanScreenState extends State<FilterDietPlanScreen> {
  AgeRange? _selectedAgeRange;
  WeightRange? _selectedWeightRange;
  DietType? _selectedDietType;

  // final TextEditingController _weightController = TextEditingController();
  // final TextEditingController _dietTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.kAppBgColor,
      appBar: const AppBarWithBackBtn(title: 'Find Diet Plan'),
      body: BlocProvider(
        create: (context) => DietPlanCubit(),
        child: Builder(
          builder: (context) {
            final cubit = context.watch<DietPlanCubit>();
            return BlocBuilder<DietPlanCubit, DietPlanState>(
              builder: (context, state) {
                if (state is AgeRangeUpdated) {
                  _selectedAgeRange = state.selectedAgeRange;
                } else if (state is WeightRangeUpdated) {
                  _selectedWeightRange = state.selectedWeightRange;
                } else if (state is DietTypeUpdated) {
                  _selectedDietType = state.selectedDietType;
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Age Range',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      DropdownButton<AgeRange>(
                        isExpanded: true,
                        value: _selectedAgeRange,
                        items: const [
                          DropdownMenuItem(
                            value: AgeRange.under25,
                            child: Text('Under 25'),
                          ),
                          DropdownMenuItem(
                            value: AgeRange.between25and45,
                            child: Text('25 - 45'),
                          ),
                          DropdownMenuItem(
                            value: AgeRange.moreThan45,
                            child: Text('More than 45'),
                          ),
                        ],
                        onChanged: (value) {
                          cubit.updateAgeRange(value!);
                        },
                        hint: Text(
                          'Select Age Range',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Weight Range',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      DropdownButton<WeightRange>(
                        isExpanded: true,
                        value: _selectedWeightRange,
                        items: const [
                          DropdownMenuItem(
                            value: WeightRange.under45kg,
                            child: Text('Under 45kg'),
                          ),
                          DropdownMenuItem(
                            value: WeightRange.between45and60kg,
                            child: Text('45kg - 60kg'),
                          ),
                          DropdownMenuItem(
                            value: WeightRange.moreThan60kg,
                            child: Text('More than 60kg'),
                          ),
                        ],
                        onChanged: (value) {
                          cubit.updateWeightRange(value!);
                        },
                        hint: Text(
                          'Select Weight Range',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Diet Type',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      DropdownButton<DietType>(
                        isExpanded: true,
                        value: _selectedDietType,
                        items: const [
                          DropdownMenuItem(
                            value: DietType.weightLoss,
                            child: Text('Weight Loss Diet'),
                          ),
                          DropdownMenuItem(
                            value: DietType.muscleBuilding,
                            child: Text('Muscle Building Diet'),
                          ),
                          DropdownMenuItem(
                            value: DietType.heartHealthy,
                            child: Text('Heart-Healthy Diet'),
                          ),
                        ],
                        onChanged: (value) {
                          cubit.updateDietType(value!);
                        },
                        hint: Text(
                          'Select Diet Type',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: DarkTheme.kErrorColor,
                        ),
                        onPressed: () {
                          // Handle button press
                        },
                        child: const Text('Find Plan'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 0),
    );
  }
}
