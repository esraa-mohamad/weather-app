import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  int code;
  String icon ;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
        required this.code,
        required this.icon,
      });

  factory WeatherModel.fromJson(dynamic json) {
    var jsonData = json["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
      date: json['current']['last_updated'],
      temp: jsonData["avgtemp_c"],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData["mintemp_c"],
      weatherStateName: jsonData["condition"]['text'],
      code: jsonData["condition"]['code'],
      icon: jsonData["condition"]['icon'],
    );
  }

  MaterialColor getThemeColor()
  {
    if(code >=100 && code<= 1030)
      {
        return Colors.orange;
      }
    else if(code >=1063 && code <=1171)
      {
        return Colors.grey;
      }
    else if(code >=1180  && code<= 1207)
      {
        return Colors.cyan;
      }
    else if(code >=1210 && code<=1264)
      {
        return Colors.deepPurple;
      }
    else
      {
        return Colors.brown;
      }

  }


}
