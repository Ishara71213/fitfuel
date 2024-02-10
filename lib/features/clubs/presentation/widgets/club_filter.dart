import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/slider_bar_with_label.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubsFilter extends StatefulWidget {
  const ClubsFilter({
    super.key,
  });

  @override
  State<ClubsFilter> createState() => _ClubsFilterState();
}

class _ClubsFilterState extends State<ClubsFilter> {
  late ClubsCubit clubsCubit;
  double currentDistanceValue = 100;
  double currentCrowdValue = 100;
  @override
  void initState() {
    super.initState();
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height - 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: DarkTheme.kDarkerGreyShade,
            height: size.height - 384,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 4.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            clubsCubit.toggleFilter('close');
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Filter Clubs",
                            style: kInputFieldHintText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SliderBarWithLabel(
                  label: "Distance",
                  currentValue: currentDistanceValue,
                  labelSufixMetrics: " km",
                  onChangeCallBack: (value) {
                    setState(() {
                      currentDistanceValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                SliderBarWithLabel(
                  label: "Crowd",
                  currentValue: currentCrowdValue,
                  steps: 5,
                  labelSufixMetrics: "%",
                  onChangeCallBack: (value) {
                    setState(() {
                      currentCrowdValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            clubsCubit.setFilter(
                                currentDistanceValue, currentCrowdValue);
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: DarkTheme.kPrimaryColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            "Filter Clubs",
                            style: kSmalltextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              currentCrowdValue = 100;
                              currentDistanceValue = 100;
                            });
                            clubsCubit.clearFilter();
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0XFF202020),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            "Clear Filter",
                            style: kSmalltextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
