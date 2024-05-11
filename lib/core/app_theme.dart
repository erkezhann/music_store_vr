import 'package:flutter/material.dart';
import 'package:music_store/core/app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: AppColor.lightAppBg,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.darkAppBg,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 17.0,
      color: Colors.black54,
    ),
    labelMedium: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  scaffoldBackgroundColor: AppColor.lightBlack,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 17.0,
      color: Colors.white70,
    ),
    labelMedium: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),
);
