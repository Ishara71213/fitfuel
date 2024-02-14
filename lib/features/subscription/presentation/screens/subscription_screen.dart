import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/fit_fuel_subscription_banner.dart';
import 'package:fitfuel/core/enums/states.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_detail_card.dart';
import 'package:fitfuel/features/subscription/presentation/bloc/subscription_cubit/subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';
import 'dart:developer' as dev;

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late ClubsCubit clubsCubit;
  late UserCubit userCubit;
  late SubscriptionCubit subscriptionCubit;

  @override
  void initState() {
    super.initState();
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
    subscriptionCubit = BlocProvider.of<SubscriptionCubit>(context);
    userCubit = BlocProvider.of<UserCubit>(context);
    clubsCubit.loadClubs();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(
          title: "Subscribe",
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const FitFuelSubscriptionBanner(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Fit Fuel's subscription offers access to a network of partner gyms, providing a cost-effective and flexible fitness solution. With one subscription, users enjoy diverse workouts at different facilities. Fit Fuel promotes an engaging fitness journey, ideal for those seeking variety and convenience in workouts.",
                          style: kGreySmallBodytextStyle,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Our Partner Gyms for this Membership",
                          style: kInputFieldText,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    color: DarkTheme.kAppBgColor,
                    height: size.height - 450,
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
              SizedBox(
                height: size.height - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: DarkTheme.kAppBgColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: FilledButtonWithLoader(
                        initText: 'Subscribe',
                        onPressed: subscribe,
                        state: States.initial,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void subscribe() async {
    PayHere.startPayment(subscriptionCubit.getPaymentModel(userCubit.userData!),
        (paymentId) async {
      await subscriptionCubit.subscribe();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: DarkTheme.kSuccessColor,
          content: Text(
            'Payment Success',
            style: kScafoldMessengerText,
          ),
          duration: const Duration(seconds: 1),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      NavigationHandler.navigate(context, RouteConst.splashDataLoadScreen);
    }, (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: DarkTheme.kErrorColor,
          content: Text(
            'Payment Failed',
            style: kScafoldMessengerText,
          ),
        ),
      );
      dev.log("One Time Payment Failed. Error: $error", name: "PayHere ERROR");
    }, () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: DarkTheme.kWarnningColor,
          content: Text(
            'Payment Terminated',
            style: kScafoldMessengerText,
          ),
        ),
      );
      dev.log("One Time Payment Dismissed", name: "PayHere INFO");
    });
  }
}
