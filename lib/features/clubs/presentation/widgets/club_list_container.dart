import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_detail_card.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_filter.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
