import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/google_map_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindClubScreen extends StatefulWidget {
  const FindClubScreen({super.key});

  @override
  State<FindClubScreen> createState() => _FindClubScreenState();
}

class _FindClubScreenState extends State<FindClubScreen> {
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
        appBar: const AppBarWithBackBtn(title: 'Find Clubs'),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              GoogleMapComponent(
                height: size.height - 450,
              ),
              SizedBox(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: DarkTheme.kDarkerGreyShade,
                      height: size.height - 320,
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: clubsCubit.clubsList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: BorderDirectional(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: DarkTheme.kDarkGreyShade,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: ListTile(
                                    trailing: CachedNetworkImageClipRect(
                                      height: 60,
                                      width: 60,
                                      borderRadius: 5,
                                      imageUrl: clubsCubit
                                          .clubsList[index].images.first,
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          clubsCubit.clubsList[index].clubName,
                                          style: TextStyle(
                                            color: DarkTheme.inputBoxTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Open from ${clubsCubit.clubsList[index].openTime} to ${clubsCubit.clubsList[index].closeTime}",
                                          style: TextStyle(
                                            color: DarkTheme.inputBoxTextColor,
                                          ),
                                        ),
                                        Text(
                                          clubsCubit.clubsList[index].address,
                                          style: TextStyle(
                                            color: DarkTheme.inputBoxTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(currentIndex: 1),
      ),
    );
  }
}
