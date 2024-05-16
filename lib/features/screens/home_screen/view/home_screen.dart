import 'package:flutter/material.dart';
import 'package:news_list/features/screens/home_screen/widgets/widgets.dart';
import 'package:news_list/features/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text('News List'),
          actions: const [
            ChangeButtonTheme(),
          ],
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => const NewsContainer(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10));
  }
}
