import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/features/schedule/domain/entities/schedule_entity.dart';
import 'package:fitfuel/features/schedule/domain/usecases/get_schedule_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final GetScheduleUsecase _getScheduleUsecase;
  ScheduleCubit({required GetScheduleUsecase getScheduleUsecase})
      : _getScheduleUsecase = getScheduleUsecase,
        super(ScheduleInitial());

  late ScheduleEntity scheduleEntity;

  void init() {
    loadSchedule();
  }

  Future<void> loadSchedule() async {
    try {
      emit(ScheduleLoading());
      scheduleEntity = await _getScheduleUsecase.call();
      emit(ScheduleLoadingSucsess());
    } on SocketException catch (_) {
      emit(ScheduleLoadingFailed());
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
      emit(ScheduleLoadingFailed());
    }
  }
}
