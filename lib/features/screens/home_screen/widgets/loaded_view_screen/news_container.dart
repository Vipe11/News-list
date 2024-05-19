import 'package:flutter/material.dart';
import 'package:news_list/features/screens/home_screen/widgets/widgets.dart';
import 'package:news_list/features/screens/new_screen/new_screen.dart';
import 'package:news_list/repositories/models/news.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    var time = DateTime.parse(news.publishedDate);
    const String emptyImage = 'assets/emptyImage.png';
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewScreen(
            news: news,
          ),
        ));
      },
      child: Container(
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            NewsContainerImage(
              image: news.multimedia.isEmpty
                  ? const AssetImage(emptyImage)
                  : NetworkImage(news.multimedia[2]['url']),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Read more...',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                      Text('${time.day}.${time.month}.${time.year}'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
