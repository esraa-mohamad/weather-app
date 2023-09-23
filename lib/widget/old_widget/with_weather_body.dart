import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../componants/constants.dart';
import '../../models/weather_model.dart';
import '../../provider/weather_provider.dart';

// ignore: must_be_immutable
class WithWeatherBody extends StatefulWidget {
   const WithWeatherBody({super.key});



  @override
  State<WithWeatherBody> createState() => _WithWeatherBodyState();
}

class _WithWeatherBodyState extends State<WithWeatherBody> {

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor()[100]!,
            weatherData!.getThemeColor()[200]!,
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[600]!,
            weatherData!.getThemeColor()[500]!,
            weatherData!.getThemeColor()[400]!,
            weatherData!.getThemeColor(),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
        [
          const SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 120,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/${weatherData!.code}.png',),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Date: ${weatherData!.date} ',
            style: const TextStyle(
                fontSize: 22,
                fontFamily: kFontFamily,
                color: kPrimaryColor
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Temperature ',
            style: TextStyle(
                fontSize: 28,
                fontFamily: kFontFamily,
                color: kPrimaryColor
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20
              ),
              decoration:  BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  Text(
                    'Avg: ${weatherData!.temp.toInt()}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: kFontFamily,
                        color: kPrimaryColor
                    ),
                  ),
                  Text(
                    'Max: ${weatherData!.maxTemp.toInt()}',
                    style:const TextStyle(
                        fontSize: 24,
                        fontFamily: kFontFamily,
                        color: kPrimaryColor
                    ),
                  ),
                  Text(
                    'Min: ${weatherData!.minTemp.toInt()}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: kFontFamily,
                        color: kPrimaryColor
                    ),
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud,
                size: 28,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "State: ${weatherData!.weatherStateName}",
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: kFontFamily,
                    color: kPrimaryColor
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
