import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/componants/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/old_weather/search.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widget/old_widget/no_weather_body.dart';
import 'package:weather_app/widget/old_widget/with_weather_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {

    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.cloud,
          color: Colors.white,
          size: 30,
        ),
        title:  Text(
          weatherData ==null ? 'Weather App': Provider.of<WeatherProvider>(context,listen: false).cityName!.toUpperCase(),
          style:  const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontFamily: Config.primaryFont,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage(
                )),
              );
            },
          ),
        ],
      ),

      body: weatherData ==null ?
      NoWeatherBody() :

      WithWeatherBody(),

    );
  }
}
