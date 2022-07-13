import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const accentPrimaryValue = 0xFF41E0DD;

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}


// const transColor = 0x00FFFFFF;
// const MaterialColor primarySwatch = const MaterialColor(
//   transColor,
//   const <int, Color>{
//     50: const Color(0xFFc6f6f5),
//     100: const Color(0xFFb3f3f1),
//     200: const Color(0xFFa0f0ee),
//     300: const Color(0xFF8deceb),
//     400: const Color(0xFF67e6e4),
//     500: Color(accentPrimaryValue),
//     600: const Color(0xFF3bcac7),
//     700: const Color(0xFF34b3b1),
//     800: const Color(0xFF2e9d9b),
//     900: const Color(0xFF278685),
//   },
// );

// ThemeData appThemeData = ThemeData();
