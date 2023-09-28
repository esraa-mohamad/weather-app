import 'package:flutter/material.dart';

import '../../componants/constants.dart';
import '../../pages/new_weather/new_search.dart';

class WeatherFailure extends  StatefulWidget {
  const WeatherFailure({super.key});

  @override
  State<WeatherFailure> createState() => _WeatherFailureState();
}

class _WeatherFailureState extends State<WeatherFailure> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  const BoxDecoration(
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
            'There Was an error 😞',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily:'Merriweather',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white
            ),
          ),
          const Text(
            'Please try again !',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily:'Merriweather',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white
            ),
          ),
          Image.asset('assets/back/sad.png'),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewSearchView()));
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
          ),
        ],
      ),
    );
  }
}
