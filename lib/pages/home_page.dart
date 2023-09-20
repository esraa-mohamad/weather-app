import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/componants/constants.dart';
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
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: const Icon(
          Icons.cloud,
          color: Colors.white,
          size: 30,
        ),
        title:  Text(
          weatherData ==null ? 'Weather App': Provider.of<WeatherProvider>(context,listen: false).cityName!.toUpperCase(),
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontFamily: kFontFamily,
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
       Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            const Center(
              child: Text(
                'There is no weather 😔 start',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: kFontFamily,
                ),
              ),
            ),
            const Text(
              'Searching Now 🔍',
              style: TextStyle(
                fontSize: 22,
                fontFamily: kFontFamily,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage(
                  )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 120
                  ),
                  width: 370,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Search Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: kFontFamily,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
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
             Image(
                 image: AssetImage('assets/images/${weatherData!.code}.png',),
               width: 200,
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
       ),

    );
  }
}
