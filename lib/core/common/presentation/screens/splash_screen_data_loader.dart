import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashDataLoadScreen extends StatefulWidget {
  const SplashDataLoadScreen({super.key});

  @override
  State<SplashDataLoadScreen> createState() => _SplashDataLoadScreenState();
}

class _SplashDataLoadScreenState extends State<SplashDataLoadScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> loadData() async {
      BlocProvider.of<UserCubit>(context).getCurrrentUserdata().then((value) {
        Future.delayed(const Duration(seconds: 2), () {
          BlocProvider.of<UserCubit>(context)
              .getCurrrentUserdata()
              .then((value) {
            NavigationHandler.navigate(context, RouteConst.homeScreen);
          });
        });
      });
    }

    loadData();

    return Scaffold(
      body: Container(
        color: DarkTheme.kAppBgColor,
        child: Center(
          child: Opacity(
            opacity: 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/images/logo-dark.png",
                    height: 140,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
