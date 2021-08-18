import 'package:flutter/material.dart';
import 'package:weather_app/Position.dart';
import 'package:weather_app/current_location_weather/model/weather.dart';

import '../const.dart';
import 'controller/get_weather_data.dart';

class CurrentLocationWeather extends StatefulWidget {

  final Pos position;

  const CurrentLocationWeather({ this.position});


  @override
  _CurrentLocationWeatherState createState() => _CurrentLocationWeatherState();
}

class _CurrentLocationWeatherState extends State<CurrentLocationWeather> {
  bool _isLoading = true;
  WeatherData data;
  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }
   getData()async{
    data = await getWeatherData(widget.position.latitude, widget.position.longitude) ;
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3CC5EE),

        actions:[ Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(Icons.search,size: 30,color: Colors.white,),
        )],
      ),
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF3CC5EE),
              Colors.blue[100]
            ],
          ),
        ),
      child:_isLoading? Center(child: CircularProgressIndicator()) :
       Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("${data.name}, ${data.sys.country}",style: KpItemStyle,),
            Icon(Icons.cloud_queue_sharp,size: 150,color: Colors.white,),

            Text("Humedity : ${data.main.humidity}%",style:KpItemStyle),
            Text("Temprature : ${(data.main.temp-273.15).round()}°",style: KpItemStyle,),
            Text(data.weather[0].description,style: KpItemStyle,),
          ].map(
                (e) => Padding(
              padding: const EdgeInsets.all(20),
              child: e,
            ),
          )
              .toList(),
        ),
      ),

    );
  }
}