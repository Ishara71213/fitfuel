import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/features/app/presentation/bloc/profile/profile_cubit.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final String appBarCustomTitle;

  const AppBarCustom({super.key, this.appBarCustomTitle = ""});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            width: 0.7,
            color: DarkTheme.kDarkerGreyShade,
          ),
        ),
      ),
      child: Stack(
        children: [
          widget.appBarCustomTitle != ""
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, top: 21, right: 12, left: 10),
                      child: Text(
                        widget.appBarCustomTitle,
                        style: kTitlText,
                      ),
                    )
                  ],
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // NavigationHandler.navigate(context, RouteConst.profileScreen);
                },
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: userCubit.userData != null &&
                                      userCubit.userData!.imageUrl != null &&
                                      userCubit.userData!.imageUrl != "null"
                                  ? CircleAvatar(
                                      minRadius: 25,
                                      maxRadius: 25,
                                      backgroundColor:
                                          DarkTheme.kDarkerGreyShade,
                                      //foregroundImage: Image.memory(bytes),
                                      child: Icon(
                                        Icons.person,
                                        color: DarkTheme.kDarkGreyShade,
                                        size: 35,
                                      ),
                                    )
                                  : CircleAvatar(
                                      minRadius: 25,
                                      maxRadius: 25,
                                      backgroundColor:
                                          DarkTheme.kDarkerGreyShade,
                                      child: Icon(
                                        Icons.person,
                                        color: DarkTheme.kDarkGreyShade,
                                        size: 35,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi ${userCubit.userData?.firstName ?? ""}",
                                    style: TextStyle(
                                        color: DarkTheme.inputBoxTextColor,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Good Morning",
                                    style: TextStyle(
                                        color: DarkTheme.inputBoxTextColor,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                      //color: DarkTheme.kGreyMediumShade,
                      borderRadius: BorderRadius.circular(38)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/icons/settings.svg',
                      height: 34,
                      colorFilter: ColorFilter.mode(
                          DarkTheme.kGreyMediumShade, BlendMode.srcIn),
                    ),
                  ),
                ),
                onPressed: () {
                  NavigationHandler.navigate(
                      context, RouteConst.settingsScreen);
                },
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
