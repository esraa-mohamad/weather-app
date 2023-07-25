import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {

    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage(
                )),
              );
            },
          ),
        ],
      ),

      body: weatherData ==null ?
      const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'There is no weather 😔 start',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            Text(
              'Searching Now 🔍',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ) :

       Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [
               weatherData!.getThemeColor(),
               weatherData!.getThemeColor()[300]!,
               weatherData!.getThemeColor()[100]!,
             ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
           ),
         ),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children:
           [
             const Spacer(
               flex: 1,
             ),
              Text(
               Provider.of<WeatherProvider>(context,listen: false).cityName!,
               style: const TextStyle(
                 fontSize: 45,
                 fontWeight: FontWeight.bold,
               ),
             ),
              Text(
               'Updated: ${weatherData!.date} ',
               style: const TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.w400,
                 color: Colors.black87,
               ),
             ),
             const SizedBox(
               height: 30,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:
               [
                 Image.asset('assets/images/${weatherData!.code}.png'),
                  Text(
                   '${weatherData!.temp.toInt()}',
                   style: const TextStyle(
                     fontSize: 40,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                  Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(
                       'Max: ${weatherData!.maxTemp.toInt()}',
                       style: const TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.w400,
                         color: Colors.black87,
                       ),
                     ),
                     Text(
                       'Min: ${weatherData!.minTemp.toInt()}',
                       style: const TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.w400,
                         color: Colors.black87,
                       ),
                     ),
                   ],
                 )
               ],
             ),
             const SizedBox(
               height: 30,
             ),
              Text(
               weatherData!.weatherStateName,
               style: const TextStyle(
                 fontSize: 30,
                 fontWeight: FontWeight.bold,
               ),
             ),
             const Spacer(
               flex: 3,
             ),
           ],
         ),
       ),

    );
  }
}
