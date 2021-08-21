import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/current_location_weather/current_location_weather.dart';
import 'package:weather_app/Position.dart';

// class Position {
//   final String latitude;
//   final String longitude;
//
//   const Position(this.latitude, this.longitude);
// }

//why when separating this class in another dart file it can't be accessed here?

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Geolocator geolocator = Geolocator();

  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation().then((position) {
      return  position;
    }).then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                CurrentLocationWeather(position: value))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.network(
          "https://aestheticwallpapers.org/wp-content/uploads/2020/08/clouds13-1.jpg"),
    ));
  }
}

Future<Position> _getLocation() async {
  var currentLocation;
  try {
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    currentLocation = null;
  }
  return currentLocation;
}
