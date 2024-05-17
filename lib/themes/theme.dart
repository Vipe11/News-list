import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    secondaryContainer: const Color.fromARGB(255, 254, 255, 243),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 229, 229, 229),
  cardColor: Colors.white,
  useMaterial3: true,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      secondaryContainer: Color.fromARGB(255, 116, 117, 95),
      brightness: Brightness.dark),
  scaffoldBackgroundColor: const Color.fromARGB(255, 42, 42, 42),
  cardColor: Colors.black,
  useMaterial3: true,
);
