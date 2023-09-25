import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/componants/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/old_services/weather_services.dart';

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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontFamily: Config.primaryFont,
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
                    horizontal: 30,
                  ),
                  labelText: 'Search',
                  labelStyle: const TextStyle(fontSize: 22, color: Config.primaryColor,fontFamily: Config.primaryFont),
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
                      color: Config.primaryColor,
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
