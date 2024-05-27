import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: false,
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  ).copyWith(
    secondary: Colors.orange[700],
    surface: Colors.blue[100],
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 24,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  primaryTextTheme: 
  const TextTheme(
    labelMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(fontSize: 18),
  ),
  
);
