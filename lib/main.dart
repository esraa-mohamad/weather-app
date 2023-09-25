import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/new_weather/welcome_view.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeView(),
    );
  }
}
