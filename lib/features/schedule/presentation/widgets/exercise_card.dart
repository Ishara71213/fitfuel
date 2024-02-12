import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/features/schedule/domain/entities/day_workout.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final DayWorkOut dayWorkOut;
  final int day;
  const ExerciseCard({
    super.key,
    required this.dayWorkOut,
    required this.day, required Color backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(color: const Color.fromARGB(255, 33, 60, 82)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Day $day",
                  style: kInputFieldText,
                ),
              ],
            ),
            if (dayWorkOut.exercises != null)
              ListView.builder(
                shrinkWrap: true,
                itemCount: dayWorkOut.exercises!.length,
                itemBuilder: (context, index) {
                  return dayWorkOut.exercises!.isNotEmpty
                      ? SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${dayWorkOut.exercises![index].exercise}"),
                              SizedBox(
                                child: Row(
                                  children: [
                                    if (dayWorkOut.exercises![index].reps !=
                                        null)
                                      Text(
                                          "Reps ${dayWorkOut.exercises![index].reps} "),
                                    const SizedBox(width: 8),
                                    if (dayWorkOut.exercises![index].sets !=
                                        null)
                                      Text(
                                          "Sets ${dayWorkOut.exercises![index].sets}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(
                          child: Row(
                            children: [
                              Text("Rest Day"),
                            ],
                          ),
                        );
                },
              )
            else
              SizedBox(
                child: Row(
                  children: [
                    Text("${dayWorkOut.type}"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
