import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> formKeyProfiles = GlobalKey<FormState>();
  final TextEditingController _userFirstNameController =
      TextEditingController();
  final TextEditingController _userLastNameController = TextEditingController();

  final List<Map<String, dynamic>> purposeOfUserList = [
    {"text": "Male", "value": "male"},
    {"text": "Female", "value": "female"},
  ];

  final List<DropdownMenuItem<String>> genderList = [
    const DropdownMenuItem(value: "male", child: Text('Male')),
    const DropdownMenuItem(value: "female", child: Text('Female'))
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: DarkTheme.kAppBgColor,
      appBar: const AppBarWithBackBtn(title: "Profile"),
      bottomNavigationBar: CustomNavBar(
        currentIndex: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKeyProfiles,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "First Name",
                          controller: _userFirstNameController,
                          hintText: "First Name",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "Last Name",
                          controller: _userLastNameController,
                          hintText: "Last Name",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: DropDownWidget(
                        hint: "Select Gender",
                        isDecoration: true,
                        onChanged: (value) {},
                        value: "male",
                        items: genderList,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "Address Line 1",
                          controller: _userLastNameController,
                          hintText: "Address Line 1",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "Address Line 2",
                          controller: _userLastNameController,
                          hintText: "Address Line 2",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
