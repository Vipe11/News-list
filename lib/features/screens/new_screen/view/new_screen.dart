import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const RangeMaintainingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          Image.network(
            width: double.infinity,
            fit: BoxFit.fill,
            'https://static01.nyt.com/images/2024/05/14/multimedia/14travel-faa-glpc/14travel-faa-glpc-articleInline.jpg',
          ),
          const SizedBox(height: 20),
          Text(
            'What the F.A.A. Bill Means for Travelers',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'New chatbot technology can talk, laugh and sing like a human. What comes next is anyone’s guess.',
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
