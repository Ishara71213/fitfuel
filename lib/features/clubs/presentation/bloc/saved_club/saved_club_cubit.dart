import 'package:equatable/equatable.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_club_by_name_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_saved_clubs_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/remove_club_by_name_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/save_club_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as dev;

part 'saved_club_state.dart';

class SavedClubCubit extends Cubit<SavedClubState> {
  final GetSavedClubsUsecase _getSavedClubsUsecase;
  final SaveClubsUsecase _saveClubsUsecase;
  final RemoveClubByNameUsecase _removeClubByNameUsecase;
  final GetClubByNameUsecase _getClubByNameUsecase;

  SavedClubCubit({
    required GetSavedClubsUsecase getSavedClubsUsecase,
    required RemoveClubByNameUsecase removeClubByNameUsecase,
    required SaveClubsUsecase saveClubsUsecase,
    required GetClubByNameUsecase getClubByNameUsecase,
  })  : _getSavedClubsUsecase = getSavedClubsUsecase,
        _saveClubsUsecase = saveClubsUsecase,
        _removeClubByNameUsecase = removeClubByNameUsecase,
        _getClubByNameUsecase = getClubByNameUsecase,
        super(SavedClubInitial());

  Future<bool> saveClub(ClubEntity entity, BuildContext context) async {
    try {
      ClubEntity result = await _saveClubsUsecase.call(entity);
      if (result.isSaved) {
        return true;
      }
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data base Failure"),
        ),
      );
    } catch (e, stacktrace) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return false;
  }

  Future<bool> unsaveClub(String name) async {
    try {
      bool result = await _removeClubByNameUsecase.call(name);
      return result;
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return false;
  }

  Future<List<ClubEntity>> lodaSavedClubList() async {
    List<ClubEntity> savedClubLst = [];
    try {
      savedClubLst = await _getSavedClubsUsecase.call();
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return savedClubLst;
  }

  Future<ClubEntity?> getClubByClubName(String name) async {
    ClubEntity? club;
    try {
      club = await _getClubByNameUsecase.call(name);
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return club;
  }
}
