import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_user_by_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/update_user_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final CreateUserUsecase createUserUsecase;
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final GetCurrentUserByUidUsecase getCurrentUserByUidUsecase;
  final GetCurrentUIdUsecase getCurrentUIdUsecase;
  final UpdateUserDataUsecase updateUserDataUsecase;
  String errorMsg = "";
  String userType = "";
  UserEntity? userData;

  UserCubit({
    required this.signInUsecase,
    required this.signUpUsecase,
    required this.createUserUsecase,
    required this.getCurrentUIdUsecase,
    required this.getCurrentUserByUidUsecase,
    required this.updateUserDataUsecase,
  }) : super(UserInitial());

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
      dev.log(e.toString(), name: "SIGN UP ERROR");
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

  Future<void> updateProfile({required UserEntity user}) async {
    emit(UserUpdating());
    try {
      userData = await updateUserDataUsecase.call(user);
      emit(UserUpdateSuccess());
    } on SocketException catch (_) {
      emit(UserUpdateFailed());
    } catch (e) {
      dev.log(e.toString(), name: "UPDATE PROFILE ERROR");
      emit(UserUpdateFailed());
    }
    Future.delayed(const Duration(seconds: 2), () {
      emit(UserInitial());
    });
  }
}
