
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/Position.dart';
import 'package:weather_app/current_location_weather/controller/seach_by_city.dart';
import 'package:weather_app/current_location_weather/model/weather.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:weather_app/map/map.dart';
import '../const.dart';
import 'controller/get_weather_data.dart';

class CurrentLocationWeather extends StatefulWidget {

  final LatLng position;
  final String city;


  const CurrentLocationWeather({ this.position, this.city});

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _CurrentLocationWeatherState createState() => _CurrentLocationWeatherState();
}

class _CurrentLocationWeatherState extends State<CurrentLocationWeather> {

  PickResult selectedPlace;

TextEditingController searchController=TextEditingController();

  bool _isLoading = true;
  WeatherData data;
  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }
   getData()async{
    if(widget.city==null)
    data = await getWeatherData(widget.position.latitude.toString(), widget.position.longitude.toString()) ;
    else if(widget.position==null)
      data = await getWeatherDataBySearch(widget.city) ;
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3CC5EE),
        toolbarHeight: 60.0,
        title: TextField(
          controller: searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText: " Search...",
              hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () async{
                     data=await getWeatherDataBySearch(searchController.text.trim());
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                         builder: (context) => CurrentLocationWeather(city: data.name)));
                },
              )),
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),

      body: ListView(
        shrinkWrap: true, //just set this property
        children: [
          Container(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Load Google Map"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapSample()
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ].map(
                    (e) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: e,
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),

    );
  }
}