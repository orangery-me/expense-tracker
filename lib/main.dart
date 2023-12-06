import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_section_5/expenses.dart';

void main() {
  runApp(const MyApp());
}

var lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
    brightness: Brightness.light,
    background: Colors.white,
    secondary: const Color.fromARGB(255, 219, 234, 220),
    onSecondary: Colors.black
);

var darkColorScheme = ColorScheme.fromSeed(seedColor: Colors.black).copyWith(
  brightness: Brightness.dark,
  background: Colors.black12,
  primary: Colors.black,
  secondary: Colors.black54,
  onSecondary: Colors.white
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        backgroundColor: darkColorScheme.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary
        ),
        cardTheme: const CardTheme().copyWith(
          color: darkColorScheme.secondary,
          surfaceTintColor: darkColorScheme.onSecondary,
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(color: darkColorScheme.primary, fontSize: 24.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: darkColorScheme.onSecondary, fontSize: 16.0,fontWeight: FontWeight.bold),
          displaySmall: TextStyle(color: darkColorScheme.onSecondary, fontSize: 14.0)
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 20.0),
        buttonTheme: const ButtonThemeData().copyWith(
          buttonColor: darkColorScheme.primary,
        )
      ),
      theme: ThemeData(
        colorScheme: lightColorScheme,
        backgroundColor: lightColorScheme.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary
        ),
        cardTheme: const CardTheme().copyWith(
          color: lightColorScheme.secondary,
          surfaceTintColor: lightColorScheme.onSecondary,
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(color: lightColorScheme.primary, fontSize: 24.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: lightColorScheme.onSecondary, fontSize: 16.0,fontWeight: FontWeight.bold),
          displaySmall: TextStyle(color: lightColorScheme.onSecondary, fontSize: 14.0)
        ),
        iconTheme: const IconThemeData(color: Colors.black54, size: 20.0)
      ),
      themeMode: ThemeMode.light,
      home: const Expenses(),
    );
  }
}

