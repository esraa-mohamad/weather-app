import 'package:flutter/material.dart';

import '../../componants/constants.dart';
import '../../pages/old_weather/search.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          const Center(
            child: Text(
              'There is no weather 😔 start',
              style: TextStyle(
                fontSize: 24,
                fontFamily: Config.primaryFont,
              ),
            ),
          ),
          const Text(
            'Searching Now 🔍',
            style: TextStyle(
              fontSize: 22,
              fontFamily: Config.primaryFont,
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
                    horizontal: 50,
                ),
                width: 370,
                decoration: BoxDecoration(
                  color: Config.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Search Now',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: Config.primaryFont,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
