import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? scWidth;
  static double? scHeight;

  //initialization of width & height
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    scWidth = mediaQueryData!.size.width;
    scHeight = mediaQueryData!.size.height;
  }

  //here we get width
  static get widthSize {
    return scWidth;
  }

  //here we get height
  static get heightSize {
    return scHeight;
  }

//  define Spacing here to make it easy to read and make it reusable (as we know don`t repeat your self )

  static const primaryColor=Color(0xff6D67E4);

  static const primaryFont='Poppins';

  static const smallColorText=Color(0xff9D9FA0);

  static const colorWeather = Color(0xff71B4DF) ;

  static const colorInfo = Color(0xff296995);

  static const colorSmallInfo = Color (0xff6CAFE0);

  static const fontInfo = 'Martian Mono';

}
