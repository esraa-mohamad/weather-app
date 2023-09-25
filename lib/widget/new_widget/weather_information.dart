import 'package:flutter/material.dart';
import 'package:weather_app/pages/new_weather/new_search.dart';

import '../../componants/constants.dart';

class WeatherInformation extends  StatefulWidget {
  const WeatherInformation({super.key});

  @override
  State<WeatherInformation> createState() => _WeatherInformationState();
}

class _WeatherInformationState extends State<WeatherInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff9AD2F7),
            Config.colorSmallInfo,
            Config.colorWeather,
            Color(0xff9AD2F7),
            Config.colorSmallInfo,
            Config.colorWeather,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/back/cloud3.png'),
                    fit: BoxFit.cover
                  )
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0,10, 0),
                          child: CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/1003.png'),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 80,),
                            Row(
                              children: [
                                Text(
                                  '25 C',
                                  style: TextStyle(
                                      fontFamily: Config.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 45,
                                      color: Config.colorInfo
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'H:30',
                                      style: TextStyle(
                                          fontFamily: Config.fontInfo,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(
                                      'L:20',
                                      style: TextStyle(
                                          fontFamily: Config.fontInfo,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  color: Config.colorInfo,
                                  size: 20,
                                ),
                                Text(
                                  'Cairo',
                                  style: TextStyle(
                                      fontFamily: Config.fontInfo,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Config.colorInfo
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Config.colorInfo,
                                  size: 20,
                                ),
                                Text(
                                  'Sunny',
                                  style: TextStyle(
                                      fontFamily: Config.fontInfo,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Config.colorInfo
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Config.colorInfo,
                                  size: 20,
                                ),
                                Text(
                                  '02:00',
                                  style: TextStyle(
                                      fontFamily: Config.fontInfo,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Config.colorInfo
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
           Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 const SizedBox(
                   height: 10,
                 ),
                 const Center(
                   child: Text(
                     'Search more city ⭐',
                     style: TextStyle(
                       fontSize: 35,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontFamily: 'Merriweather',
                     ),
                   ),
                 ),
                 Image.asset('assets/back/clodyy.png',height: 220,),
                 ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         padding: const EdgeInsets.symmetric(
                           horizontal: 60,
                           vertical: 10
                         ),
                         shadowColor: Config.colorInfo,
                         backgroundColor: Config.colorInfo,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30)
                         )
                     ),
                     onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewSearchView()));
                     },
                     child: const Text(
                         'Search',
                     style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       fontFamily: Config.fontInfo,

                     ),
                     )
                 ),
               ],
             ),
          )
        ],
      ),
    );
  }
}
