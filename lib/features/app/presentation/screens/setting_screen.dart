import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/enums/states.dart';
import 'package:fitfuel/core/mock_json/schedule.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  States uploadState = States.initial;

  void uploadData() async {
    CollectionReference userCollectionRef;
    userCollectionRef = firestore.collection("Users");
    late Map<String, dynamic> payload;
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
      appBar: const AppBarWithBackBtn(),
      body: FilledButtonWithLoader(
        initText: 'Upload Data',
        loadingText: 'Upload Data',
        successText: 'Done',
        onPressed: () {
          uploadData();
        },
        state: uploadState,
      ),
    ));
  }
}
