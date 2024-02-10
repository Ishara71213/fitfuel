import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:flutter/material.dart';

class ClubDetailCard extends StatelessWidget {
  const ClubDetailCard({
    super.key,
    required this.club,
  });

  final ClubEntity club;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: DarkTheme.kDarkGreyShade,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListTile(
        trailing: CachedNetworkImageClipRect(
          height: 60,
          width: 60,
          borderRadius: 5,
          imageUrl: club.images.first,
        ),
        title: Row(
          children: [
            Text(
              club.clubName,
              style: TextStyle(
                color: DarkTheme.inputBoxTextColor,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Open from ${club.openTime} to ${club.closeTime}",
              style: TextStyle(
                color: DarkTheme.inputBoxTextColor,
              ),
            ),
            Text(
              club.address,
              style: TextStyle(
                color: DarkTheme.inputBoxTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
