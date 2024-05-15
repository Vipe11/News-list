import 'package:flutter/material.dart';
import 'package:news_list/themes/theme.dart';

import 'features/screens/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}
