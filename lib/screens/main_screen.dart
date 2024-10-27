import 'package:aesthetic_weather/utils/weather.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  final WeatherData weatherData;

  const MainScreen({super.key, required this.weatherData});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;

  void updateDisplayInfo(WeatherData weatherData){
    setState(() { // setState verileri anlık olarak aktif değiştirmeyi sağlar.
      temperature = weatherData.currentTemperature.round();
      city = weatherData.city;
      WeatherDisplayData weatherDisplayData = weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100,),
              Container(
                child: weatherDisplayIcon
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text("$temperature°",
                  style: const TextStyle(
                    color:Colors.white,
                    fontSize: 90.0,
                    letterSpacing: -5,
                  ),
                ),
              ),
              Center(
                child: Text(city,
                  style: const TextStyle(
                    color:Colors.white,
                    fontSize: 50.0,
                    letterSpacing: -5,
                  ),
                ),
              ),

            ],
          ) ,
        )

    );
  }
}
