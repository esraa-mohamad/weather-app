import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/pages/new_weather/new_search.dart';

import '../../componants/constants.dart';
class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key});
  @override
  Widget build(BuildContext context) {

    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
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
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                       Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0,0, 0),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage('https:${weatherModel.icon}'),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50,),
                          Row(
                            children: [
                              Text(
                                '${weatherModel.temp.round()}C',
                                style: const TextStyle(
                                    fontFamily: Config.primaryFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45,
                                    color: Config.colorInfo
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'H:${weatherModel.maxTemp.round()}',
                                    style: const TextStyle(
                                        fontFamily: Config.fontInfo,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    'L:${weatherModel.minTemp.round()}',
                                    style: const TextStyle(
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
                              const Icon(
                                Icons.place,
                                color: Config.colorInfo,
                                size: 20,
                              ),
                              Text(
                                weatherModel.cityName,
                                style: const TextStyle(
                                    fontFamily: Config.fontInfo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Config.colorInfo
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Config.colorInfo,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${weatherModel.date.hour}:${weatherModel.date.minute}',
                                style: const TextStyle(
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud,
                        color: Config.colorInfo,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        weatherModel.weatherStateName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
            ),
          ),
           Expanded(
             child: SingleChildScrollView(
               child: Container(
                 color: Colors.transparent,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
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
               ),
             ),
           )
        ],
      ),
    );
  }


}
