import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/core/components/location_popup_message.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_all_clubs_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as dev;

part 'clubs_state.dart';

class ClubsCubit extends Cubit<ClubsState> {
  final GetAllClubsUsecase _getAllClubsUsecase;

  ClubsCubit({required GetAllClubsUsecase getAllClubsUsecase})
      : _getAllClubsUsecase = getAllClubsUsecase,
        super(ClubsInitial());

  LatLng? currentLocationTemp;
  List<ClubEntity> clubsList = [];

  Future<void> loadClubs() async {
    try {
      if (clubsList.isNotEmpty) return;
      emit(ClubLoading());
      clubsList = await _getAllClubsUsecase.call();
      emit(ClubLoadingSuccess());
    } on SocketException catch (_) {
      emit(ClubLoadingFailed());
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
      emit(ClubLoadingFailed());
    }
  }

  void updateMapCameraView(
      String latitude, String longitude, GoogleMapController controller) {
    double lat = double.parse(latitude);
    double lng = double.parse(longitude);
    currentLocationTemp = LatLng(lat, lng);
    emit(LocationDataGathering(curruntLocation: LatLng(lat, lng)));
    controller.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
  }

  void checkIsLocationServiceEnabled(BuildContext context) async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const LocationPopUp();
          },
        );
      });
    }
  }

  void determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position currentLocation = await Geolocator.getCurrentPosition();

    emit(LocationDataGathering(
        curruntLocation:
            LatLng(currentLocation.latitude, currentLocation.longitude)));
  }
}
