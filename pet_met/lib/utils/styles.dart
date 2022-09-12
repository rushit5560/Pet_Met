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
    var timePickerTheme = TimePickerThemeData(
      backgroundColor:
          isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(
            color:
                isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
            width: 1),
      ),
      // dayPeriodBorderSide: BorderSide(
      //     color: isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
      //     width: 4),
      // dayPeriodColor:
      //     isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(
          color: isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
          width: 1,
        ),
      ),
      // dayPeriodTextColor:
      //     isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      // dayPeriodShape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(8)),
      //   side: BorderSide(color: Colors.orange, width: 4),
      // ),
      hourMinuteTextStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      // helpTextStyle: const TextStyle(
      //     fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      // inputDecorationTheme: const InputDecorationTheme(
      //   border: InputBorder.none,
      //   contentPadding: EdgeInsets.all(0),
      // ),
      // entryModeIconColor: Colors.orange,
    );
    return ThemeData(
      //primarySwatch: primarySwatch,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      backgroundColor:
          isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      indicatorColor:
          isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
      hintColor: isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
      highlightColor:
          isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
      hoverColor: isDarkTheme ? AppColors.greyColor : AppColors.darkThemeColor,
      focusColor: isDarkTheme ? AppColors.greyColor : AppColors.darkThemeColor,
      splashColor: isDarkTheme
          ? AppColors.greyColor.withOpacity(0.35)
          : AppColors.darkThemeColor.withOpacity(0.35),
      disabledColor: AppColors.greyColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor:
            isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,
        selectionHandleColor:
            isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
        selectionColor:
            isDarkTheme ? AppColors.greyColor : AppColors.darkThemeColor,
      ),
      // textTheme: TextTheme
      //     .copyWith(
      //       button: _theme.textTheme.button?.copyWith(
      //         //change it in this part
      //       ),
      //     )
      //     .apply(fontFamily: GoogleFonts.roboto().fontFamily),
      // colorScheme: isDarkTheme
      //     ? const ColorScheme.dark(
      //         primary: AppColors.darkThemeColor,
      //         secondary: AppColors.whiteColor,
      //         brightness: Brightness.dark,
      //       )
      //     : const ColorScheme.light(
      //         primary: AppColors.whiteColor,
      //         secondary: AppColors.darkThemeColor,
      //         brightness: Brightness.light,
      //       ),
      timePickerTheme: timePickerTheme,

      canvasColor:
          isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      cardColor: isDarkTheme ? AppColors.darkThemeColor : AppColors.whiteColor,
      // canvasColor:
      //     isDarkTheme ? AppColors.whiteColor : AppColors.darkThemeColor,

      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.light()
                : const ColorScheme.dark(),
          ),
      // appBarTheme: const AppBarTheme(
      //   elevation: 0.0,

      // ),
    );
  }
}
