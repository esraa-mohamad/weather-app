import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

import '../../models/weather_model.dart';
import '../../services/new_services/weather_services_dio.dart';

class GetWeatherCubit extends Cubit<WeatherState>{

  GetWeatherCubit(super.initialState);


  getCurrentWeather({required String cityName}) async
  {
      WeatherModel weatherModel = await
      WeatherServicesDio(Dio()).getWeatherForecast(cityName: cityName);

  }
}