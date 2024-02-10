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
  @override
  Widget build(BuildContext context) {
    ClubsCubit clubsCubit = BlocProvider.of<ClubsCubit>(context);
    LatLng currentLocation = const LatLng(6.888801846911015, 79.85811646338293);
    return SizedBox(
      height: widget.height,
      child: BlocBuilder<ClubsCubit, ClubsState>(
        builder: (context, state) {
          if (state is ClubsInitial) {
            clubsCubit.checkIsLocationServiceEnabled(context);
            clubsCubit.determinePosition();
          } else if (state is LocationDataGathering) {
            currentLocation = state.curruntLocation;
            _controller.future.then((GoogleMapController controller) {
              // The GoogleMapController is ready, you can call methods on it here.
              clubsCubit.updateMapCameraView(
                  state.curruntLocation.latitude.toString(),
                  state.curruntLocation.longitude.toString(),
                  controller);
            });
          } else {
            currentLocation =
                const LatLng(6.888801846911015, 79.85811646338293);
          }
          return GoogleMap(
            onTap: (argument) => FocusScope.of(context).unfocus(),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 13.4746,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: currentLocation,
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
