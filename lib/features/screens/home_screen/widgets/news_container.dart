import 'package:flutter/material.dart';
import 'package:news_list/features/screens/home_screen/widgets/widgets.dart';
import 'package:news_list/features/screens/new_screen/new_screen.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var time = DateTime.parse('2024-05-14T11:33:19-04:00');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const NewScreen(),
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
            const NewsContainerImage(
              image:
                  'https://static01.nyt.com/images/2024/05/14/multimedia/14travel-faa-glpc/14travel-faa-glpc-articleInline.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'What the F.A.A. Bill Means for Travelers',
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
