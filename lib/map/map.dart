import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:weather_app/current_location_weather/controller/get_current_position.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {


  GoogleMapController _controller;
Marker position;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom:11.5,
  );

@override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        onMapCreated: (controller)=>_controller=controller,
        markers: {position},
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,

      ),

    );
  }
}
