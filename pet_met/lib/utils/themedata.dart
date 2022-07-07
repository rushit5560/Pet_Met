import 'package:flutter/material.dart';

const accentPrimaryValue = 0xFF41E0DD;

const MaterialColor primarySwatch = const MaterialColor(
  accentPrimaryValue,
  const <int, Color>{
    50: const Color(0xFFc6f6f5),
    100: const Color(0xFFb3f3f1),
    200: const Color(0xFFa0f0ee),
    300: const Color(0xFF8deceb),
    400: const Color(0xFF67e6e4),
    500: Color(accentPrimaryValue),
    600: const Color(0xFF3bcac7),
    700: const Color(0xFF34b3b1),
    800: const Color(0xFF2e9d9b),
    900: const Color(0xFF278685),
  },
);

ThemeData appThemeData = ThemeData();
