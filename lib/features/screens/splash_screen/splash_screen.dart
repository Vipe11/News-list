import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_list/features/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          Center(
            child: Image.asset(
              height: 200,
              'assets/Logo.png',
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'News List',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Expanded(child: SizedBox()),
          LoadingAnimationWidget.prograssiveDots(
            color: Colors.yellow,
            size: 60,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
