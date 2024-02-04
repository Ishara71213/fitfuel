import 'package:fitfuel/config/routes/route_const.dart';
import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/core/enums/states.dart';
import 'package:fitfuel/core/utils/navigation_handler.dart';
import 'package:fitfuel/core/widgets_library/widgets_library.dart';
import 'package:fitfuel/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  final TextEditingController _userFirstNameController =
      TextEditingController();
  final TextEditingController _userLastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  String? purposeOfUserSelectedVal;

  @override
  void dispose() {
    _userFirstNameController.dispose();
    _userLastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DarkTheme.kAppBgColor,
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) async {
          if (state is UserSuccess) {
            await Future.delayed(const Duration(seconds: 1), () {
              BlocProvider.of<AuthCubit>(context).appStarted();
            });
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 30.0, bottom: 0.0),
                child: Column(
                  children: <Widget>[
                    Form(
                        key: formKeySignUp,
                        child: Column(
                          children: [
                            SizedBox(
                              child: Image.asset(
                                "assets/images/logo-dark.png",
                                height: 140,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text("Create Account", style: kTitlText),
                            ),
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
                                child: TextFormInput(
                                  fieldName: "Email",
                                  hintText: "Email",
                                  controller: _emailController,
                                  prefixIcon: const Icon(Icons.email),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextFormInput(
                                  fieldName: "Password",
                                  hintText: "Password",
                                  controller: _passwordController,
                                  prefixIcon: const Icon(Icons.lock),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: DateScrollSelectorInput(
                                  fieldName: "Date of Birth",
                                  hintText: "Date of Birthday",
                                  controller: _dateOfBirthController,
                                  prefixIcon: const Icon(Icons.calendar_month),
                                )),
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                return FilledButtonWithLoader(
                                    initText: 'Sign Up',
                                    loadingText: 'Creating Account',
                                    successText: 'Account Created',
                                    onPressed: () {
                                      if (formKeySignUp.currentState!
                                          .validate()) {
                                        submitSignUp(context);
                                      }
                                    },
                                    state: (state is UserLoading)
                                        ? States.loading
                                        : (state is UserSuccess)
                                            ? States.success
                                            : States.initial);
                              },
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 20.0,
                      child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                          return (state is UserFailrue)
                              ? Column(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        BlocProvider.of<UserCubit>(context)
                                            .errorMsg,
                                        style: kwarningText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: kSmalltextStyle),
                          const SizedBox(width: 4.0),
                          TextButton(
                            onPressed: () {
                              NavigationHandler.navigateWithRemovePrevRoute(
                                  context, RouteConst.signInScreen);
                            },
                            child: Text(
                              "Sign In",
                              style: kPrimarySmalltextStyle,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submitSignUp(context) async {
    await BlocProvider.of<UserCubit>(context).submitSignUp(
        user: UserEntity(
      firstName: _userFirstNameController.text,
      lastName: _userLastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      dob: _dateOfBirthController.text,
    ));
  }
}
