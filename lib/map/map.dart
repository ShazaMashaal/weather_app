import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/current_location_weather/current_location_weather.dart';




class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  LatLng position;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // List<Marker> myMarker = [];
  Set<Marker> markers = Set();


  Future<void> _goToTheLake() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                CurrentLocationWeather(position: position)));
  }




  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('get weather data!'),
        icon: Icon(Icons.cloud_queue),
      ),
      body: Center(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: GoogleMap(
            markers: markers,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap:  (pos) {
          position=pos;
print(position);
              Marker f =

              Marker(markerId: MarkerId('1'), position:pos,

                  onTap: (){});

              setState(() {

                markers.add(f);

              });

            },
          ),

        ),
      ),

    );
  }

}
