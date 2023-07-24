import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData["avgtemp_c"],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData["mintemp_c"],
      weatherStateName: jsonData["condition"]['text'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Patchy sleet nearby' ||
        weatherStateName == 'Patchy snow nearby' ||
        weatherStateName == 'Patchy freezing drizzle nearby') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Overcast' ||
        weatherStateName == 'Mist') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain nearby' ||
        weatherStateName == 'Patchy light drizzle' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks in nearby' ||
        weatherStateName == 'Blizzard' ||
        weatherStateName == 'Fog') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Patchy sleet nearby' ||
        weatherStateName == 'Patchy snow nearby' ||
        weatherStateName == 'Patchy freezing drizzle nearby') {
      return Colors.blue;
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Overcast' ||
        weatherStateName == 'Mist') {
      return Colors.brown;
    } else if (weatherStateName == 'Patchy rain nearby' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy light drizzle') {
      return Colors.grey;
    } else if (weatherStateName == 'Thundery outbreaks in nearby' ||
        weatherStateName == 'Blizzard' ||
        weatherStateName == 'Fog') {
      return Colors.deepPurple;
    } else {
      return Colors.yellow;
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'date=$date  temp=$temp   maxTemp=$maxTemp    minTemp=$minTemp';
  }
}
