import 'dart:async';

import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapComponent extends StatefulWidget {
  final double height;
  const GoogleMapComponent({super.key, required this.height});

  @override
  State<GoogleMapComponent> createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late ClubsCubit clubsCubit;
  @override
  void initState() {
    super.initState();
  }

  void init(BuildContext context) async {
    clubsCubit = BlocProvider.of<ClubsCubit>(context);
    // await clubsCubit.checkIsLocationServiceEnabled(context);
    // await clubsCubit.determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    ClubsCubit clubsCubit = BlocProvider.of<ClubsCubit>(context);
    return SizedBox(
      height: widget.height,
      child: BlocBuilder<ClubsCubit, ClubsState>(
        builder: (context, state) {
          if (state is LocationDataGathering) {
            _controller.future.then((GoogleMapController controller) {
              // The GoogleMapController is ready,
              clubsCubit.updateMapCameraView(
                  clubsCubit.currentLocation.latitude.toString(),
                  clubsCubit.currentLocation.longitude.toString(),
                  controller);
            });
          }
          return GoogleMap(
            onTap: (argument) => FocusScope.of(context).unfocus(),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: clubsCubit.currentLocation,
              zoom: 16.4746,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: clubsCubit.currentLocation,
                infoWindow: const InfoWindow(title: 'Current Location'),
              ),
              ...clubsCubit.markers
            },
            onMapCreated: (GoogleMapController controller) async {
              String darkMapStyle =
                  await rootBundle.loadString('assets/json/map_style.json');
              _controller.complete(controller);
              _controller.future.then((value) {
                value.setMapStyle(darkMapStyle);
              });
            },
          );
        },
      ),
    );
  }
}
