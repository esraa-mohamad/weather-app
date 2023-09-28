import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/pages/new_weather/weather_info.dart';

import '../../componants/constants.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>{
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff9AD2F7),
                Config.colorSmallInfo,
                Config.colorWeather,
                Color(0xff9AD2F7),
                Config.colorSmallInfo,
                Config.colorWeather,
                Color(0xff9AD2F7),
                Config.colorSmallInfo,
                Config.colorWeather,
                Color(0xff9AD2F7),
                Config.colorSmallInfo,
                Config.colorWeather,
                Color(0xff9AD2F7),
                Config.colorSmallInfo,
                Config.colorWeather,
                Color(0xff9AD2F7),
                Config.colorSmallInfo,
                Config.colorWeather,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/back/cloud.png'),
            const Text(
              'Welcome to our weather',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:'Merriweather',
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white
              ),
            ),
            IconButton(
                onPressed: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const WeatherInfoView()));
                },
                icon:const Icon(
                  Icons.cloud,
                  size: 55,
                  color: Config.colorInfo,
                )
            ),
          ],
        ),
      ),
    );
  }
}
