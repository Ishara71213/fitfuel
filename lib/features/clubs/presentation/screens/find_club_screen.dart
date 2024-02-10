import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_detail_card.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_filter.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_search_bar.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(title: 'Find Clubs'),
        body: const SingleChildScrollView(
          child: Stack(
            children: [
              GoogleMapComponent(
                height: 240,
              ),
              ClubListContainer()
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(currentIndex: 1),
      ),
    );
  }
}

class ClubListContainer extends StatefulWidget {
  const ClubListContainer({
    super.key,
  });

  @override
  State<ClubListContainer> createState() => _ClubListContainerState();
}

class _ClubListContainerState extends State<ClubListContainer> {
  late ClubsCubit clubsCubit;

  @override
  void initState() {
    super.initState();
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<ClubsCubit, ClubsState>(
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedSlide(
              offset: Offset(clubsCubit.bottomDetailOffsetx, 0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: size.height - 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const ClubSearchBar(),
                    Container(
                      color: DarkTheme.kDarkerGreyShade,
                      height: size.height - 460,
                      child: BlocBuilder<ClubsCubit, ClubsState>(
                        builder: (context, state) {
                          if (state is ClubLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: DarkTheme.kGreyColor,
                              ),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: clubsCubit.clubsList.length,
                              itemBuilder: (context, index) {
                                return ClubDetailCard(
                                    club: clubsCubit.clubsList[index]);
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSlide(
              offset: Offset(clubsCubit.filterOffsetx, 0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: const ClubsFilter(),
            )
          ],
        );
      },
    );
  }
}
