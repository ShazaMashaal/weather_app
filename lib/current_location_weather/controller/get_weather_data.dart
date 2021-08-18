import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/current_location_weather/model/weather.dart';
// WeatherData
Future<WeatherData> getWeatherData(String lat,String long)async{
  http.Response response = await http.get(
      Uri.parse("http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=9c15af06166e304ab03ac7075db2b74a"),

      );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Weather Data');
  }

}