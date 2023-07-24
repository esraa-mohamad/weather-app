import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  String apiKey = '5c4cd30e964940bd907134132232207';
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try
    {
      Uri url =
      Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);


      weatherModel = WeatherModel.fromJson(data);
    }catch(e)
    {
      if (kDebugMode) {
        print(e);
      }
    }

    return weatherModel;
  }
}
