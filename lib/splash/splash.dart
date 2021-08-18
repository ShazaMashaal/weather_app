import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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

String lat;
String long;

 getCurrentLocation() async{
  var position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  var latitude=position.latitude;
  var longitude=position.longitude;
  lat="$latitude";
  long="$longitude";

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     getCurrentLocation();
  }



  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: CurrentLocationWeather(position:Pos(lat,long)),
      imageBackground: NetworkImage("https://aestheticwallpapers.org/wp-content/uploads/2020/08/clouds13-1.jpg"),

    );
  }
}


