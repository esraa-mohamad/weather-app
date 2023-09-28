import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/widget/new_widget/failure_weather.dart';
import 'package:weather_app/widget/new_widget/no_weather_info.dart';
import 'package:weather_app/widget/new_widget/weather_information.dart';


class WeatherInfoView extends StatefulWidget {
  const WeatherInfoView({super.key});

  @override
  State<WeatherInfoView> createState() => _WeatherInfoViewState();
}

class _WeatherInfoViewState extends State<WeatherInfoView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: BlocBuilder<GetWeatherCubit,WeatherState>(
            builder: (context ,state)
            {
                  if (state is NoWeatherState)
                  {
                      return const NoWeatherInfo();
                  }
                  else if (state is WeatherLoadedState)
                  {
                    return  WeatherInformation();
                  }
                  else
                  {
                    return const WeatherFailure();
                  }
            }
        ),
    );
  }
}
