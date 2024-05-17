import 'package:flutter/material.dart';
import 'package:news_list/features/widgets/widgets.dart';
import 'package:news_list/repositories/models/news.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeParse = DateTime.parse(news.publishedDate);
    return Scaffold(
      appBar: AppBar(
        title: Text(news.section),
        centerTitle: true,
        actions: const [
          ChangeButtonTheme(),
        ],
      ),
      body: ListView(
        physics: const RangeMaintainingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            news.title,
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            news.abstract,
            style: theme.textTheme.bodyLarge,
          ),
          if (news.multimedia.isNotEmpty) ...[
            const SizedBox(height: 20),
            Image.network(
              width: double.infinity,
              fit: BoxFit.fill,
              news.multimedia[2]['url'],
            ),
          ],
          const SizedBox(height: 20),
          Text('Source: ${news.source}'),
          Text(
              'Was published: ${timeParse.day}.${timeParse.month}.${timeParse.year}')
        ],
      ),
    );
  }
}
