import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/new_services/weather_services_dio.dart';


class NewSearchView extends StatefulWidget {
  const NewSearchView({super.key});

  @override
  State<NewSearchView> createState() => _NewSearchViewState();
}

class _NewSearchViewState extends State<NewSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0D8AA6),
              Color(0xff95D8E1),
              Color(0xff8BC9D6),
              Color(0xff0D8AA6),
              Color(0xffCAEBF0),
              Color(0xff50CFDE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Search about city',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Merriweather',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (data)
                {
                },
                onSubmitted: (data) async {
                  WeatherModel weatherModel = await
                  WeatherServicesDio(Dio()).getWeatherForecast(cityName: data);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: const TextStyle(fontSize: 22, color: Colors.lightBlue,fontFamily: 'Merriweather'),
                  hintText: 'Enter City Name',
                  hintStyle: const TextStyle(fontSize: 18, color: Colors.lightBlueAccent) ,
                  suffixIcon: IconButton(
                    onPressed: ()async
                    {
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.lightBlue,
                    ),
                  ),
                  border:  OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 5,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular((15),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 5,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular((15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 5,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular((15),
                    ),
                  ),
                ),
              ),
              Image.asset('assets/back/cloudy.png'),
            ],
          ),
        ),
      ),
    );
  }
}
