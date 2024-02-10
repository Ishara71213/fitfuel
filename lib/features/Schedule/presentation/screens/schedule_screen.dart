import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/google_map_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindScheduleScreen extends StatefulWidget {
  const FindScheduleScreen({super.key});

  @override
  State<FindScheduleScreen> createState() => _FindScheduleScreenState();
}

class _FindScheduleScreenState extends State<FindScheduleScreen> {
  final TextEditingController _locationSearchController =
      TextEditingController();

  late ClubsCubit clubsCubit;

  @override
  void initState() {
    super.initState();
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
    clubsCubit.init();
  }

  @override
  void dispose() {
    _locationSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(title: 'Find Schedule'),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              GoogleMapComponent(
                height: size.height - 450,
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(currentIndex: 1),
      ),
    );
  }
  // import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Schedule App',
      home: GymScheduleScreen(),
    );
  }
}

class GymScheduleScreen extends StatelessWidget {
  // Sample GymScheduleModel data
  final GymScheduleModel gymSchedule = GymScheduleModel(
    level: "Intermediate",
    description: "For those with some fitness experience...",
    day1: {"workoutType": "Upper Body Strength", "exercises": ["Bench Press", "Rows", "Shoulder Press", "Bicep Curls"]},
    day2: {"workoutType": "Cardio and Core", "exercises": ["Running", "Plank Variations"]},
    day3: {"workoutType": "Lower Body Strength", "exercises": ["Squats", "Deadlifts", "Lunges"]},
    day4: {"workoutType": "Rest or Light Activity"},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Level: ${gymSchedule.level}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${gymSchedule.description}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Text(
              'Weekly Schedule',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            for (int day = 1; day <= 7; day++) ...[
              if (gymSchedule.getDay(day) != null) ...[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day $day',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Workout Type: ${gymSchedule.getDay(day)!['workoutType']}',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Exercises: ${gymSchedule.getDay(day)!['exercises'].join(', ')}',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class GymScheduleModel {
  final String level;
  final String description;
  final Map<String, dynamic> day1;
  final Map<String, dynamic> day2;
  final Map<String, dynamic> day3;
  final Map<String, dynamic> day4;
  final Map<String, dynamic>? day5;
  final Map<String, dynamic>? day6;
  final Map<String, dynamic>? day7;

  GymScheduleModel({
    required this.level,
    required this.description,
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    this.day5,
    this.day6,
    this.day7,
  });

  Map<String, dynamic>? getDay(int day) {
    switch (day) {
      case 1:
        return day1;
      case 2:
        return day2;
      case 3:
        return day3;
      case 4:
        return day4;
      case 5:
        return day5;
      case 6:
        return day6;
      case 7:
        return day7;
      default:
        return null;
    }
  }
}

}
