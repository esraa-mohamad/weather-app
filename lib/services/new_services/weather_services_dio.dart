import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServicesDio
{
  final Dio dio;

  final String baseUrl = 'http://api.weatherapi.com/v1';

  final String apiKey ='5c4cd30e964940bd907134132232207';

  WeatherServicesDio( this.dio);

  Future<WeatherModel> getWeatherForecast ({required String cityName})
  async {
    try {
      Response response= await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1'
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel ;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ?? 'OOPS , there is an error , try later';
      throw Exception(errorMessage);
    } catch (e)
    {
      log(e.toString());
      throw Exception('OOPS , there is an error , try later');
    }
  }
}
