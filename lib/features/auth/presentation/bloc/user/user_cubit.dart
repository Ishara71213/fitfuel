import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_user_by_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final CreateUserUsecase createUserUsecase;
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final GetCurrentUserByUidUsecase getCurrentUserByUidUsecase;
  final GetCurrentUIdUsecase getCurrentUIdUsecase;
  String errorMsg = "";
  String userType = "";
  UserEntity? userData;

  UserCubit(
      {required this.signInUsecase,
      required this.signUpUsecase,
      required this.createUserUsecase,
      required this.getCurrentUIdUsecase,
      required this.getCurrentUserByUidUsecase})
      : super(UserInitial());

  Future<void> resetToInitialState() async {
    emit(UserInitial());
  }

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signInUsecase.call(user);
      userData = await getCurrentUserByUidUsecase();
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailrue());
    } catch (_) {
      emit(UserFailrue());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signUpUsecase.call(user);
      await createUserUsecase.call(user);
      userData = await getCurrentUserByUidUsecase();
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailrue());
    } catch (e) {
      final error = e.toString();
      errorMsg = error.split(']').last;
      emit(UserFailrue());
    }
  }

  Future<void> getCurrrentUserdata() async {
    try {
      emit(UserLoading());
      userData = await getCurrentUserByUidUsecase();
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailrue());
    } catch (_) {
      emit(UserFailrue());
    }
  }
}
