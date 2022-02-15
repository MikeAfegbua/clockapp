import 'package:flutter/material.dart';

ThemeData mytheme() {
  return ThemeData(
    textTheme: const TextTheme(caption: TextStyle(color: Colors.white)),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.resolveWith((state) => Colors.white),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.grey[850],
      hourMinuteTextColor: Colors.white,
      hourMinuteColor: Colors.grey[850],
      dayPeriodTextColor: Colors.white,
      dayPeriodColor: Colors.grey[850],
      dialHandColor: Colors.orange.shade400,
      dialBackgroundColor: Colors.grey[850],
      dialTextColor: Colors.white,
      entryModeIconColor: Colors.white,
      dayPeriodBorderSide: BorderSide.none,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          side: BorderSide.none),
    ),
    primarySwatch: Colors.blue,
  );
}
