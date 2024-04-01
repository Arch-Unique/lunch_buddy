import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColorBackground = Color(0xFFa897a6);

  //Text Colors
  static const Color textColor = Colors.black;
  static const Color darkTextColor = Color(0xff24425e);
  static Color lightTextColor = const Color(0xFF0F0F0F).withOpacity(0.6);

  //Action Colors
  static const Color disabledColor = Color(0xFFEBE9E9);
  static const Color borderColor = Color(0xFFD1D1D1);
  static const Color circleBorderColor = Color(0xFFD9D9D9);
  static const Color textBorderColor = Color(0xFFFEE6F2);
  static const Color textFieldColorOld = Color(0xFFFFF5F9);
  static const Color textFieldColor = Color(0xFFFCFAFF);
  static const Color searchIconColor = Color(0xFFC4C4C4);
  static const Color searchTextColor = Color(0xFFA0A0A0);

  static const Color lightBlueBackground = Color(0xFFADD8E6);
  static const Color lightGreenBackground = Color(0xFF90EE90);
  static const Color lightCoralBackground = Color(0xFFF08080);
  static const Color lightGoldenrodBackground = Color(0xFFFAFAD2);
  static const Color lavenderBackground = Color(0xFFE6E6FA);
  static const Color lightSalmonBackground = Color(0xFFFFA07A);
  static const Color powderBlueBackground = Color(0xFFB0E0E6);
  static const Color mistyRoseBackground = Color(0xFFFFE4E1);
  static const Color paleTurquoiseBackground = Color(0xFFAFEEEE);
  static const Color thistleBackground = Color(0xFFD8BFD8);

  //Other Colors
  static const Color red = Color(0xFFFF1F1F);
  static const Color green = Color(0xFF1FFF1F);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color transparent = Colors.transparent;

  static const int _primaryColorValue = 0xFFfce5e7;

  static const MaterialColor primaryColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFFCE4EB),
      100: Color(0xFFF8B3C5),
      200: Color(0xFFF484A1),
      300: Color(0xFFF2557C),
      400: Color(0xFFEF2B5E),
      500: Color(_primaryColorValue),
      600: Color(0xFFE30A67),
      700: Color(0xFFD8085D),
      800: Color(0xFFCB0654),
      900: Color(0xFFBF044A),
    },
  );
}
