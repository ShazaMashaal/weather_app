import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  var currentLocation;
  try {
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    currentLocation = null;
  }
  return currentLocation;
}