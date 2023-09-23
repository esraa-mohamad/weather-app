import 'package:flutter/material.dart';

import '../../componants/constants.dart';

class WithWeatherInfo extends StatefulWidget {
  const WithWeatherInfo({super.key});

  @override
  State<WithWeatherInfo> createState() => _WithWeatherInfoState();
}

class _WithWeatherInfoState extends State<WithWeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
        [
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 120,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/1000.png',),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Date: 10:28',
            style: TextStyle(
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  Text(
                    'Avg: 33 C',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: kFontFamily,
                        color: kPrimaryColor
                    ),
                  ),
                  Text(
                    'Max: 40 C',
                    style:TextStyle(
                        fontSize: 24,
                        fontFamily: kFontFamily,
                        color: kPrimaryColor
                    ),
                  ),
                  Text(
                    'Min: 25 C',
                    style: TextStyle(
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud,
                size: 28,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "State: Sunny ",
                style: TextStyle(
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
