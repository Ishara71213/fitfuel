import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  CustomNavBar({super.key, required this.currentIndex});

  final List<BottomNavigationBarItem> itemList = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/Home.svg',
        height: 24,
        colorFilter:
            ColorFilter.mode(DarkTheme.kGreyMediumShade, BlendMode.srcIn),
      ),
      label: "Home",
      backgroundColor: DarkTheme.kBlackColor,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/FindClubs.svg',
        height: 24,
        colorFilter:
            ColorFilter.mode(DarkTheme.kGreyMediumShade, BlendMode.srcIn),
      ),
      label: "Clubs",
      backgroundColor: DarkTheme.kBlackColor,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/schedule.svg',
        height: 24,
        colorFilter:
            ColorFilter.mode(DarkTheme.kGreyMediumShade, BlendMode.srcIn),
      ),
      label: "Schedule",
      backgroundColor: DarkTheme.kBlackColor,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/calendar.svg',
        height: 24,
        colorFilter:
            ColorFilter.mode(DarkTheme.kGreyMediumShade, BlendMode.srcIn),
      ),
      label: "Diet Plan",
      backgroundColor: DarkTheme.kBlackColor,
    ),
  ];

  void navigationToScreens(BuildContext context, int currentPage) {
    switch (currentPage) {
      case 0:
        NavigationHandler.navigate(context, RouteConst.homeScreen);
      case 1:
        NavigationHandler.navigate(context, RouteConst.findClubScreen);
      case 2:
        NavigationHandler.navigate(context, RouteConst.homeScreen);
      case 3:
        NavigationHandler.navigate(context, RouteConst.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => navigationToScreens(context, value),
      currentIndex: currentIndex,
      items: itemList,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      selectedItemColor: DarkTheme.kGreyColor,
      unselectedItemColor: DarkTheme.kGreyMediumShade,
      backgroundColor: DarkTheme.kBlackColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}
