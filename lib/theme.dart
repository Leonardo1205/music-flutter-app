import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF1976D2),
  scaffoldBackgroundColor: Color(0xFF0D47A1),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Color(0xFF1976D2),
    secondary: Color(0xFFBBDEFB),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1976D2),
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF1976D2),
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
