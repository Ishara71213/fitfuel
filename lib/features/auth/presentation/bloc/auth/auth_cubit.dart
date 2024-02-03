import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUIdUsecase getCurrentUIdUsecase;
  final IsSignInUsecase isSignInUsecase;
  final SignOutUsecase signOutUsecase;

  AuthCubit(
      {required this.getCurrentUIdUsecase,
      required this.isSignInUsecase,
      required this.signOutUsecase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUsecase.call();
      if (isSignIn) {
        final uid = await getCurrentUIdUsecase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);

      emit(UnAuthenticated());
    }
  }

  Future<void> signIn() async {
    try {
      final uid = await getCurrentUIdUsecase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> signOut() async {
    try {
      await signOutUsecase.call();
      emit(UnAuthenticated());
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }
}
