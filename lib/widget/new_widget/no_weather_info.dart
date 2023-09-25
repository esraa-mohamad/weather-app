import 'package:flutter/material.dart';
import 'package:weather_app/pages/new_weather/new_search.dart';

import '../../componants/constants.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        children: [
          const Spacer(),
          const Text(
            'No Weather Info 🌝',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Merriweather',
            ),
          ),
          Image.asset('assets/back/cloudd.png'),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewSearchView()));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(60),
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)
                  ),
                  color:Color(0Xff006E91)
                ),
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
