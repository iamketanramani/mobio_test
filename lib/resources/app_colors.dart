import 'package:flutter/material.dart';

class AppColors {
//https://material.io/design/color/the-color-system.html#tools-for-picking-colors
//https://material.io/resources/color/#!/?view.left=0&view.right=1

  static const MaterialColor appThemeColor = MaterialColor(
    0xff3371E9, //Change statusBarColor from here
    <int, Color>{
      50: Color(0xFFe3f2ff),
      100: Color(0xFFbcddff),
      200: Color(0xFF90c9ff),
      300: Color(0xFF62b3ff),
      400: Color(0xFF42a2ff),
      500: Color(0xff2b91ff),
      600: Color(0xFF3183fe),
      700: Color(0xFF3370e9),
      800: Color(0xFF345ed6),
      900: Color(0xFF333cb6),
    },
  );

  static const appColor = appThemeColor;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const transparentColor = Colors.transparent;
  static const Color themeColor = Color(0xff3371E9);
  static const Color hyperLinkColor = Color(0xFF3374EA);
  static const Color appBarBackColor = Color(0xFFB5B5B5);
  static const Color redColor = Color(0xFFFF0000);
  static const Color greyColor = Color(0xFFAAAAAA);
  static const Color blueColor = Color(0xFF3374EA);
  static const Color lightBlueColor = Color(0xFFE2ECFF);
  static const Color greenColor = Color(0xFF00AE23);
  static const Color bottomNavIconColor = Color(0xFF9A9A9A);
  static const Color cyanColor = Color(0xFF08B89C);
  static const Color b9b9b9Color = Color(0xFFB9B9B9);
  static const Color blueGradient0 = Color(0xFF14CBFF);
  static const Color blueGradient1 = Color(0xFF366BE8);
  static const Color avatarBorderColor = Color(0xFFE2ECFF);
  static const Color switchSelected = Color(0xFF22A1F5);
  static const Color trophyColor = Color(0xFFdeb82d);
  static const Color coinCardColor = Color(0xFFf3ba2f);
  static const Color indicatorUnSelectedColor = Color(0xFFC7E1FF);
}
