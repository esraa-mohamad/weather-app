import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/componants/constants.dart';
import 'package:weather_app/pages/new_weather/weather_info.dart';
import 'package:weather_app/pages/old_weather/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const WeatherInfoView(),
    );
  }
}
