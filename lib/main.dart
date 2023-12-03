import 'package:flutter/material.dart';
import 'package:flutter_section_5/expenses.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 73, 6));
var kDarkColorScheme = ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 2, 25, 2));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: ThemeData(
        colorScheme: kDarkColorScheme,
        cardTheme: CardTheme(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        ),
         textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(color: kDarkColorScheme.surfaceTint, fontSize: 24.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: kDarkColorScheme.onPrimaryContainer, fontSize: 16.0,fontWeight: FontWeight.bold),
        ),
      ),
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer
        ),
        cardTheme: CardTheme(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(color: kColorScheme.surfaceTint, fontSize: 24.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: kColorScheme.onPrimaryContainer, fontSize: 16.0,fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black54, size: 20.0)
      ),
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    );
  }
}

