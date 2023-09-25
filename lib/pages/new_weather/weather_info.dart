import 'package:flutter/material.dart';
import 'package:weather_app/widget/new_widget/no_weather_info.dart';


class WeatherInfoView extends StatefulWidget {
  const WeatherInfoView({super.key});

  @override
  State<WeatherInfoView> createState() => _WeatherInfoViewState();
}

class _WeatherInfoViewState extends State<WeatherInfoView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: NoWeatherInfo(),
    );
  }
}
