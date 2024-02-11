import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/constants/firebase_collections.dart';
import 'package:fitfuel/core/enums/states.dart';
import 'package:fitfuel/core/mock_json/schedule.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  States uploadState = States.initial;
  final svgKeyboardArrowRight = SvgPicture.asset('assets/icons/arrowBack.svg');
  //Fire base data upload
  void uploadData() async {
    CollectionReference userCollectionRef;
    //Change collection Name to Collection that you need to push data into
    userCollectionRef = firestore.collection(FirebaseCollections.schedules);
    late Map<String, dynamic> payload;
    //Change Payload value into Map file located in Core/Mock Json folder
    //Create Map<String,Dynamic> yourDataMapName
    //insert data and Import it and replace the payload value
    payload = scheduleMock;
    setState(() {
      uploadState = States.loading;
    });
    await userCollectionRef.doc().set(payload);
    setState(() {
      uploadState = States.success;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppBarWithBackBtn(
        title: "Settings",
      ),
      // body: FilledButtonWithLoader(
      //   initText: 'Upload Data',
      //   loadingText: 'Upload Data',
      //   successText: 'Done',
      //   onPressed: () {
      //     uploadData();
      //   },
      //   state: uploadState,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 90),
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceVariant),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.savedClubsScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                        'assets/icons/save.svg',
                        colorFilter: ColorFilter.mode(
                            DarkTheme.inputBoxTextColor, BlendMode.srcIn),
                      ),
                      title: Text(
                        'Saved Clubs',
                        style: kGreySmalltextStyle,
                      ),
                      trailing: IconButton(
                        icon: svgKeyboardArrowRight,
                        onPressed: () {
                          NavigationHandler.navigate(
                              context, RouteConst.savedClubsScreen);
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.savedSchedulesScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                        'assets/icons/save.svg',
                        colorFilter: ColorFilter.mode(
                            DarkTheme.inputBoxTextColor, BlendMode.srcIn),
                      ),
                      title: Text(
                        'Saved Schedules',
                        style: kGreySmalltextStyle,
                      ),
                      trailing: IconButton(
                        icon: svgKeyboardArrowRight,
                        onPressed: () {
                          NavigationHandler.navigate(
                              context, RouteConst.savedSchedulesScreen);
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.savedDietPlansScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                        'assets/icons/save.svg',
                        colorFilter: ColorFilter.mode(
                            DarkTheme.inputBoxTextColor, BlendMode.srcIn),
                      ),
                      title: Text(
                        'Saved Diet Plans',
                        style: kGreySmalltextStyle,
                      ),
                      trailing: IconButton(
                        icon: svgKeyboardArrowRight,
                        onPressed: () {
                          NavigationHandler.navigate(
                              context, RouteConst.savedDietPlansScreen);
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.savedDietPlansScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                        'assets/icons/logout.svg',
                        colorFilter: ColorFilter.mode(
                            DarkTheme.inputBoxTextColor, BlendMode.srcIn),
                      ),
                      title: Text(
                        'Log out',
                        style: kGreySmalltextStyle,
                      ),
                      trailing: IconButton(
                        icon: svgKeyboardArrowRight,
                        onPressed: () {
                          NavigationHandler.navigate(
                              context, RouteConst.savedDietPlansScreen);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
