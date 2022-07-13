import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_met/utils/app_colors.dart';

class Styles {
  static const accentPrimaryValue = 0xFF41E0DD;

  static const transColor = 0x00FFFFFF;
  static const MaterialColor primarySwatch = MaterialColor(
    transColor,
    <int, Color>{
      50: Color(0xFFc6f6f5),
      100: Color(0xFFb3f3f1),
      200: Color(0xFFa0f0ee),
      300: Color(0xFF8deceb),
      400: Color(0xFF67e6e4),
      500: Color(accentPrimaryValue),
      600: Color(0xFF3bcac7),
      700: Color(0xFF34b3b1),
      800: Color(0xFF2e9d9b),
      900: Color(0xFF278685),
    },
  );

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: primarySwatch,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      backgroundColor:
          isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      indicatorColor:
          isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
      buttonColor:
          isDarkTheme ? const Color(0xff3B3B3B) : const Color(0xffF1F5FB),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor:
          isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
