import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/club_image_slider.dart';
import 'package:fitfuel/core/components/fit_fuel_subscription_banner.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/saved_club/saved_club_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_subscription_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ClubDetailsScreen extends StatefulWidget {
  final dynamic club;
  const ClubDetailsScreen({super.key, required this.club});

  @override
  State<ClubDetailsScreen> createState() => _ClubDetailsScreenState();
}

class _ClubDetailsScreenState extends State<ClubDetailsScreen> {
  late ClubsCubit clubsCubit;
  late SavedClubCubit savedClubCubit;
  late ClubEntity clubEntity;
  bool isSaved = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    clubEntity = widget.club['club'] as ClubEntity;
    isSaved = clubEntity.isSaved;
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
    savedClubCubit = BlocProvider.of<SavedClubCubit>(context);
    ClubEntity? club =
        await savedClubCubit.getClubByClubName(clubEntity.clubName);

    setState(() {
      if (club != null) {
        isSaved = true;
      } else {
        isSaved = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWithBackBtn(
          title: "Club Details",
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        clubEntity.clubName,
                        style: kInputFieldText,
                      ),
                      Text(
                        "Open from ${clubEntity.openTime} to ${clubEntity.closeTime}",
                        style: kGreySmalltextStyle,
                      ),
                    ],
                  ),
                ),
                ClubImageSlider(
                  imageUrlList: clubEntity.images,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        clubEntity.address,
                        style: kGreySmalltextStyle,
                      ),
                      BlocBuilder<ClubsCubit, ClubsState>(
                        builder: (context, state) {
                          return GestureDetector(
                              onTap: () async {
                                saveUnsave();
                              },
                              child: !isSaved
                                  ? SvgPicture.asset(
                                      'assets/icons/save_icon.svg',
                                      height: 15,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/save_icon_saved.svg',
                                      height: 15,
                                    ));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Local Subscriptions",
                        style: kGreySmalltextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: clubEntity.subscriptionPlans.length,
                  itemBuilder: (context, index) {
                    return ClubSubscriptionPlan(
                      clubSubscriptionPlan: clubEntity.subscriptionPlans[index],
                    );
                  },
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [FitFuelSubscriptionBanner()],
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveUnsave() async {
    if (!isSaved) {
      bool result = await savedClubCubit.saveClub(clubEntity, context);
      if (result) {
        if (mounted) {
          setState(() {
            isSaved = true;
          });
        }
      }
    } else {
      bool isDeleted = await savedClubCubit.unsaveClub(clubEntity.clubName);
      if (isDeleted) {
        if (mounted) {
          isSaved = false;
          setState(() {
            isSaved = false;
          });
        }
      }
    }
  }
}
