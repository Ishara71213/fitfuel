import 'package:firebase_core/firebase_core.dart';
import 'package:fitfuel/config/routes/on_generate_route.dart';
import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/diet_plans/presentation/bloc/dietplan_cubit/diet_plan_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/saved_club/saved_club_cubit.dart';
import 'package:fitfuel/features/schedule/presentation/bloc/schedule/schedule_cubit.dart';
import 'package:fitfuel/features/subscription/presentation/bloc/subscription_cubit/subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfuel/core/utils/di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const FitFuelApp());
}

class FitFuelApp extends StatelessWidget {
  const FitFuelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()),
        BlocProvider<ClubsCubit>(create: (_) => di.sl<ClubsCubit>()),
        BlocProvider<DietPlanCubit>(create: (_) => di.sl<DietPlanCubit>()),
        BlocProvider<SavedClubCubit>(create: (_) => di.sl<SavedClubCubit>()),
        BlocProvider<ScheduleCubit>(create: (_) => di.sl<ScheduleCubit>()),
        BlocProvider<SubscriptionCubit>(
            create: (_) => di.sl<SubscriptionCubit>()),
      ],
      child: MaterialApp(
        title: 'Fit Fule',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteConst.initialRoute,
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
        home: null,
      ),
    );
  }
}
