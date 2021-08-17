import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:geolocator/geolocator.dart';



class Splash extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: AfterSplash(),
      imageBackground: NetworkImage("https://aestheticwallpapers.org/wp-content/uploads/2020/08/clouds13-1.jpg"),




      // image: Image.asset(
      //     ''),
    );
  }
}

class AfterSplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
