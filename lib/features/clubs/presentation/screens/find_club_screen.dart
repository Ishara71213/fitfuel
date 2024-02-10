import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_list_container.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/google_map_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindClubScreen extends StatefulWidget {
  const FindClubScreen({super.key});

  @override
  State<FindClubScreen> createState() => _FindClubScreenState();
}

class _FindClubScreenState extends State<FindClubScreen> {
  final TextEditingController _locationSearchController =
      TextEditingController();

  late ClubsCubit clubsCubit;

  @override
  void initState() {
    super.initState();
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
    clubsCubit.init();
  }

  @override
  void dispose() {
    _locationSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        appBar: const AppBarWithBackBtn(title: 'Find Clubs'),
        body: const SingleChildScrollView(
          child: Stack(
            children: [
              GoogleMapComponent(
                height: 240,
              ),
              ClubListContainer()
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(currentIndex: 1),
      ),
    );
  }
}
