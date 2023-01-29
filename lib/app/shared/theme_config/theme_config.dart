
import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static const MaterialColor materialColor = MaterialColor(
      0xff000103,
      <int, Color>{
        50: Color(0xff000410),
        100: Color(0xff00030E),
        200: Color(0xff00030C),
        300: Color(0xff00020B),
        400: Color(0xff000209),
        500: Color(0xff000208),
        600: Color(0xff000106),
        700: Color(0xff000105),
        800: Color(0xff000103),
      }
  );
  static ThemeData applicationTheme(){
    return ThemeData(
      primarySwatch: materialColor,
      fontFamily: "SF-Pro",
      errorColor: Colors.red,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: black,
          selectionColor: black,
          selectionHandleColor: black
      ),
    );
  }

}