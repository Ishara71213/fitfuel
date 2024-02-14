import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationHandler {
  static void navigate(BuildContext context, String path) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamed(context, path);
    }
  }

  static void navigateWithRemovePrevRoute(BuildContext context, String path) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
    }
  }

  static void navigateWithArgumnets(
      BuildContext context, String path, Map<String, dynamic> args) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamed(context, path, arguments: args);
    }
  }

  static void navigateToHomeByUserType(BuildContext context) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    bool isSubscribedUser =
        BlocProvider.of<UserCubit>(context).userData!.isSubscribed;
    if (isSubscribedUser) {
      if (previousRouteName != RouteConst.homeScreen) {
        Navigator.pushNamed(context, RouteConst.homeScreenSubscribedUser);
      }
    } else {
      if (previousRouteName != RouteConst.homeScreen) {
        Navigator.pushNamed(context, RouteConst.homeScreen);
      }
    }
  }
}
