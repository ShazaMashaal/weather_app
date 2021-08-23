import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<LatLng> getLocation() async {
  LatLng currentLocation;
  try {
    currentLocation = (await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.best)) as LatLng ;
  } catch (e) {
    currentLocation = null;
  }
  return currentLocation;
}