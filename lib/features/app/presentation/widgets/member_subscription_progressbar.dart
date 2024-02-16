import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberSubscriptionCircularProgressBar extends StatefulWidget {
  const MemberSubscriptionCircularProgressBar({
    super.key,
  });

  @override
  State<MemberSubscriptionCircularProgressBar> createState() =>
      _MemberSubscriptionCircularProgressBarState();
}

class _MemberSubscriptionCircularProgressBarState
    extends State<MemberSubscriptionCircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  int remainingDays = 0;
  int duration = 0;
  int allDays = 0;
  double progress = 0;
  bool isLoading = false;

  late UserCubit userCubit;

  @override
  void initState() {
    super.initState();
    userCubit = BlocProvider.of<UserCubit>(context);

    calculate();
  }

  Future<void> calculate() async {
    setState(() {
      isLoading = true;
    });
    try {
      remainingDays = userCubit.userData!.currentSubscription!.remainingDates!;
      duration = userCubit.userData!.currentSubscription!.subscriptionDuration!;
      progress = remainingDays / duration;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      throw Exception('Network error');
    }

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _progressAnimation = Tween(begin: 0.0, end: progress).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 10,
        height: 10,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(DarkTheme.kPrimaryColor),
        ),
      );
    } else {
      return AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, child) {
          return Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 240,
                  height: 240,
                  child: CircularProgressIndicator(
                    value: _progressAnimation.value,
                    strokeWidth: 20,
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(DarkTheme.kPrimaryColor),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${remainingDays >= 0 ? (remainingDays) : ''} ${remainingDays > 1 ? 'days' : 'day'}',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: DarkTheme.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Remaining',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
