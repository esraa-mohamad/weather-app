import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/new_services/weather_services_dio.dart';

import '../../componants/constants.dart';

class NewSearchView extends StatefulWidget {
  const NewSearchView({super.key});

  @override
  State<NewSearchView> createState() => _NewSearchViewState();
}

class _NewSearchViewState extends State<NewSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontFamily: kFontFamily,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (data)
                {
                },
                onSubmitted: (data) async {
                  WeatherModel weatherModel = await
                  WeatherServicesDio(Dio()).getWeatherForecast(cityName: data);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  labelText: 'Search',
                  labelStyle: const TextStyle(fontSize: 22, color: kPrimaryColor,fontFamily: kFontFamily),
                  hintText: 'Enter City Name',
                  suffixIcon: IconButton(
                    onPressed: ()async
                    {
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      (15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      (15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
