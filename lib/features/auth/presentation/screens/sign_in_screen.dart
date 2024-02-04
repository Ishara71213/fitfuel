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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) async {
        if (state is UserSuccess) {
          await Future.delayed(const Duration(seconds: 1), () {
            BlocProvider.of<AuthCubit>(context).appStarted();
          });
        }
      },
      child: Scaffold(
        backgroundColor: DarkTheme.kAppBgColor,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 60,
                    ),
                    Image.asset(
                      "assets/images/logo-dark.png",
                      alignment: Alignment.center,
                      scale: 0.5,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                        key: formKeySignIn,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: TextFormInput(
                                fieldName: "Email",
                                controller: _emailController,
                                hintText: "Email",
                                prefixIcon: const Icon(Icons.email),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: TextFormInput(
                                fieldName: "Password",
                                hintText: "Password",
                                controller: _passwordController,
                                prefixIcon: const Icon(Icons.lock),
                              ),
                            ),
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                return FilledButtonWithLoader(
                                    initText: 'Sign In',
                                    loadingText: 'Signing In',
                                    successText: 'Done',
                                    onPressed: () {
                                      if (formKeySignIn.currentState!
                                          .validate()) {
                                        submitSignIn(context);
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
                      height: 30.0,
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
                                    context, RouteConst.signUpScreen);
                              },
                              child: Text(
                                "Sign Up",
                                style: kPrimarySmalltextStyle,
                              ))
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

  void submitSignIn(context) async {
    await BlocProvider.of<UserCubit>(context).submitSignIn(
        user: UserEntity(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}
