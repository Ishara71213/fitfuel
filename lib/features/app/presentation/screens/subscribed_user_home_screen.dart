import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/features/app/presentation/widgets/member_subscription_progressbar.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscribedUserHomeScreen extends StatefulWidget {
  const SubscribedUserHomeScreen({super.key});

  @override
  State<SubscribedUserHomeScreen> createState() =>
      _SubscribedUserHomeScreenState();
}

class _SubscribedUserHomeScreenState extends State<SubscribedUserHomeScreen> {
  late UserCubit userCubit;
  @override
  void initState() {
    super.initState();
    userCubit = BlocProvider.of<UserCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarCustom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.9,
                    child: Card(
                      color: DarkTheme.kBlackDarkerColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('Remaining Time',
                                    style: kInputFieldHintText),
                                const SizedBox(height: 20),
                                const SizedBox(
                                  width: 240,
                                  height: 240,
                                  child:
                                      MemberSubscriptionCircularProgressBar(),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 19.0, vertical: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          side: BorderSide(
                                            width: 1.2,
                                            color: DarkTheme.kGreyMediumShade,
                                          ),
                                        ),
                                        child: Text(
                                          "Upgrade Subscription",
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: DarkTheme.kGreyMediumShade,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
