import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/features/schedule/presentation/bloc/schedule/schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleSelectScreen extends StatefulWidget {
  const ScheduleSelectScreen({super.key});

  @override
  State<ScheduleSelectScreen> createState() => _ScheduleSelectScreenState();
}

class _ScheduleSelectScreenState extends State<ScheduleSelectScreen> {
  late ScheduleCubit scheduleCubit;
  @override
  void initState() {
    scheduleCubit = BlocProvider.of<ScheduleCubit>(context);
    scheduleCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(title: 'Schedules'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: FilledButton(
                  onPressed: () {
                    NavigationHandler.navigateWithArgumnets(
                        context,
                        RouteConst.scheduleDetailsScreen,
                        {"planType": scheduleCubit.scheduleEntity.beginner});
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                     backgroundColor: Color.fromARGB(255, 41, 171, 226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Beginner",
                    style: kInputFieldText.copyWith(color: Color.fromARGB(255, 14, 13, 13)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: FilledButton(
                  onPressed: () {
                    NavigationHandler.navigateWithArgumnets(
                        context, RouteConst.scheduleDetailsScreen, {
                      "planType": scheduleCubit.scheduleEntity.intermediate
                    });
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor:Color.fromARGB(255, 255, 94, 77),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Intermediate",
                   style: kInputFieldText.copyWith(color: Color.fromARGB(255, 14, 13, 13)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: FilledButton(
                  onPressed: () {
                    NavigationHandler.navigateWithArgumnets(
                        context,
                        RouteConst.scheduleDetailsScreen,
                        {"planType": scheduleCubit.scheduleEntity.advanced});
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor:  Color.fromARGB(255, 130, 204, 87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Advanced",
                    style: kInputFieldText.copyWith(color: Color.fromARGB(255, 14, 13, 13)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: FilledButton(
                  onPressed: () {
                    NavigationHandler.navigateWithArgumnets(
                        context,
                        RouteConst.scheduleDetailsScreen,
                        {"planType": scheduleCubit.scheduleEntity.elite});
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: Color.fromARGB(255, 253, 203, 110),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Elite",
                    style: kInputFieldText.copyWith(color: Color.fromARGB(255, 14, 13, 13)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: FilledButton(
                  onPressed: () {
                    NavigationHandler.navigateWithArgumnets(
                        context,
                        RouteConst.scheduleDetailsScreen,
                        {"planType": scheduleCubit.scheduleEntity.expert});
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor:Color.fromARGB(255, 175, 82, 222),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Expert",
                    style: kInputFieldText.copyWith(color: Color.fromARGB(255, 14, 13, 13)),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(currentIndex: 2),
      ),
    );
  }
}
