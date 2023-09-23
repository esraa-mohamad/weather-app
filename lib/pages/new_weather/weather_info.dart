import 'package:flutter/material.dart';
import 'package:weather_app/pages/new_weather/new_search.dart';
import 'package:weather_app/widget/old_widget/no_weather_body.dart';

import '../../componants/constants.dart';

class WeatherInfoView extends StatefulWidget {
  const WeatherInfoView({super.key});

  @override
  State<WeatherInfoView> createState() => _WeatherInfoViewState();
}

class _WeatherInfoViewState extends State<WeatherInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      centerTitle: true,
      leading: const Icon(
        Icons.cloud,
        color: Colors.white,
        size: 30,
      ),
      title:  const Text(
        "Weather App",
        style:  TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontFamily: kFontFamily,
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
              MaterialPageRoute(builder: (context) => const NewSearchView(
              )),
            );
          },
        ),
      ],
    ),
      body: const NoWeatherBody(),
    );
  }
}
