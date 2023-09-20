import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/componants/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:kPrimaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                  cityName=data;
                },
                onSubmitted: (data) async {
                  cityName=data;
                  WeatherServices services =WeatherServices();
                  WeatherModel? weather =await services.getWeather(cityName: cityName!);


                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 35,
                  ),
                  labelText: 'Search',
                  labelStyle:
                      const TextStyle(fontSize: 22, color: kPrimaryColor,fontFamily: kFontFamily),
                  hintText: 'Enter City Name',
                  suffixIcon: IconButton(
                    onPressed: ()async
                    {
                      WeatherServices services =WeatherServices();
                      WeatherModel? weather =await services.getWeather(cityName: cityName!);


                      // ignore: use_build_context_synchronously
                      Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                      // ignore: use_build_context_synchronously
                      Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      (10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      (10),
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
