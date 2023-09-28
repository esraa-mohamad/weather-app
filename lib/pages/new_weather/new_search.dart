import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/new_services/weather_services_dio.dart';


class NewSearchView extends StatefulWidget {
  const NewSearchView({super.key});

  @override
  State<NewSearchView> createState() => _NewSearchViewState();
}

class _NewSearchViewState extends State<NewSearchView> {

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
        child: ListView(
          children:
          [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
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
                        var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                        getWeatherCubit.getCurrentWeather(cityName: data);
                        Navigator.pop(context);
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
                    Image.asset('assets/back/cloudy.png',height: 350,),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
