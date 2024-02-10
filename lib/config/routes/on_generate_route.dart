import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/core/common/presentation/screens/error_screen.dart';
import 'package:fitfuel/core/common/presentation/screens/splash_screen.dart';
import 'package:fitfuel/core/common/presentation/screens/splash_screen_data_loader.dart';
import 'package:fitfuel/features/app/presentation/screens/home_screen.dart';
import 'package:fitfuel/features/app/presentation/screens/setting_screen.dart';
import 'package:fitfuel/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:fitfuel/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:fitfuel/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:fitfuel/features/clubs/presentation/screens/find_club_screen.dart';
import 'package:fitfuel/features/clubs/presentation/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    //final args = settings.arguments;
    String routeName = settings.name.toString();
    switch (settings.name) {
      case RouteConst.initialRoute:
        return materialBuilder(widget: const HomeScreen(), route: routeName);
      case RouteConst.splashScreen:
        return materialBuilder(widget: const SplashScreen(), route: routeName);
      case RouteConst.splashDataLoadScreen:
        return materialBuilder(
            widget: const SplashDataLoadScreen(), route: routeName);
      case RouteConst.signInScreen:
        return materialBuilderAuthScreens(
            widget: const SignInScreen(), route: routeName);
      case RouteConst.signUpScreen:
        return materialBuilderAuthScreens(
            widget: const SignUpScreen(), route: routeName);
      case RouteConst.homeScreen:
        return materialBuilder(widget: const HomeScreen(), route: routeName);
      case RouteConst.findClubScreen:
        return materialBuilder(
            widget: const FindClubScreen(), route: routeName);
      case RouteConst.clubDetailScreen:
        return materialBuilder(
            widget: const FindClubScreen(), route: routeName);
      case RouteConst.settingsScreen:
         return materialBuilder(widget: const SettingScreen(), route: routeName);
      case RouteConst.scheduleScreen:
        return materialBuilder(widget: const FindScheduleScreen(), route: routeName);

      //error page
      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}

//Only use this function to generate routes for auth screens
//Because its return the argument(widget) if user not authenticated
MaterialPageRoute materialBuilderAuthScreens(
    {required Widget widget, required String route}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: route),
    builder: (context) => BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          // String? previousRouteName =
          //     ModalRoute.of(context)?.settings.name.toString();
          // if (previousRouteName == RouteConst.signUpScreen) {
          //   return const UserInfoInitialScreen();
          // }
          return const SplashDataLoadScreen();
        } else if (state is UnAuthenticated) {
          return widget;
        } else {
          return const SignInScreen();
        }
      },
    ),
  );
}

//use this function to generate routes only for auth screens
//return the argument(widget) if user is authenticated
MaterialPageRoute materialBuilder(
    {required Widget widget, required String route}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: route),
    builder: (context) => BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return widget;
        } else {
          return const SignInScreen();
        }
      },
    ),
  );
}
