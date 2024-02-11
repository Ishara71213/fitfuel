import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_levels.dart';
import 'package:fitfuel/features/schedule/presentation/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class ScheduleDetailScreen extends StatefulWidget {
  final dynamic data;
  const ScheduleDetailScreen({super.key, required this.data});

  @override
  State<ScheduleDetailScreen> createState() => _ScheduleDetailScreenState();
}

class _ScheduleDetailScreenState extends State<ScheduleDetailScreen> {
  late ScheduleLevels scheduleLevels;
  @override
  void initState() {
    super.initState();
    scheduleLevels = widget.data["planType"] as ScheduleLevels;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(title: "Schedule Details"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        scheduleLevels.description,
                        style: kGreySmalltextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (scheduleLevels.day1 != null)
                  ExerciseCard(
                    day: 1,
                    dayWorkOut: scheduleLevels.day1!,
                  ),
                const SizedBox(height: 20),
                if (scheduleLevels.day2 != null)
                  ExerciseCard(
                    day: 2,
                    dayWorkOut: scheduleLevels.day2!,
                  ),
                const SizedBox(height: 20),
                if (scheduleLevels.day3 != null)
                  ExerciseCard(
                    day: 3,
                    dayWorkOut: scheduleLevels.day3!,
                  ),
                const SizedBox(height: 20),
                if (scheduleLevels.day4 != null)
                  ExerciseCard(
                    day: 4,
                    dayWorkOut: scheduleLevels.day4!,
                  ),
                const SizedBox(height: 20),
                if (scheduleLevels.day5 != null)
                  ExerciseCard(
                    day: 5,
                    dayWorkOut: scheduleLevels.day5!,
                  ),
                const SizedBox(height: 20),
                if (scheduleLevels.day6 != null)
                  ExerciseCard(
                    day: 6,
                    dayWorkOut: scheduleLevels.day6!,
                  ),
                const SizedBox(height: 20),
                if (scheduleLevels.day7 != null)
                  ExerciseCard(
                    day: 7,
                    dayWorkOut: scheduleLevels.day7!,
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar(currentIndex: 2),
      ),
    );
  }
}
