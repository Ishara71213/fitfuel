import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/core/components/custom_nav_bar.dart';
import 'package:fitfuel/core/enums/states.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserCubit userCubit;
  final GlobalKey<FormState> formKeyProfiles = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  String selectedGender = "";

  final List<Map<String, dynamic>> purposeOfUserList = [
    {"text": "Male", "value": "male"},
    {"text": "Female", "value": "female"},
  ];

  final List<DropdownMenuItem<String>> genderList = [
    const DropdownMenuItem(value: "male", child: Text('Male')),
    const DropdownMenuItem(value: "female", child: Text('Female'))
  ];

  @override
  void initState() {
    super.initState();
    userCubit = BlocProvider.of<UserCubit>(context);
    _firstNameController.text = userCubit.userData?.firstName ?? "";
    _lastNameController.text = userCubit.userData?.lastName ?? "";
    _addressLine1Controller.text = userCubit.userData?.addressLine1 ?? "";
    _addressLine2Controller.text = userCubit.userData?.addressLine2 ?? "";
    selectedGender = userCubit.userData?.gender ?? "selectedGender";
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    super.dispose();
  }

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
                          controller: _firstNameController,
                          hintText: "First Name",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "Last Name",
                          controller: _lastNameController,
                          hintText: "Last Name",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: DropDownWidget(
                        hint: selectedGender == ""
                            ? "Select Gender"
                            : selectedGender,
                        isDecoration: true,
                        onChanged: (value) {
                          selectedGender = value ?? "";
                        },
                        value: selectedGender,
                        items: genderList,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "Address Line 1",
                          controller: _addressLine1Controller,
                          hintText: "Address Line 1",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormInput(
                          fieldName: "Address Line 2",
                          controller: _addressLine2Controller,
                          hintText: "Address Line 2",
                          prefixIcon: const Icon(Icons.verified_user),
                        )),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return FilledButtonWithLoader(
                            initText: 'Update Profile',
                            loadingText: 'Updating Profile',
                            successText: 'Updating Success',
                            onPressed: () {
                              if (formKeyProfiles.currentState!.validate()) {
                                updateProfile(context);
                              }
                            },
                            state: (state is UserUpdating)
                                ? States.loading
                                : (state is UserUpdateSuccess)
                                    ? States.success
                                    : States.initial);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void updateProfile(context) async {
    await BlocProvider.of<UserCubit>(context).updateProfile(
        user: UserEntity(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      gender: selectedGender,
      addressLine1: _addressLine1Controller.text,
      addressLine2: _addressLine2Controller.text,
    ));
  }
}
