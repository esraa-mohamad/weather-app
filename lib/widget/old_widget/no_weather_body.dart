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
                    horizontal: 50,
                ),
                width: 370,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
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
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
