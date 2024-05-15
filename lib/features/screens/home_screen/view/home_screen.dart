import 'package:flutter/material.dart';
import 'package:news_list/features/screens/new_screen/new_screen.dart';

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
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => const NewsContainer(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10));
  }
}

class NewsContainer extends StatelessWidget {
  const NewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://static01.nyt.com/images/2024/05/14/multimedia/14travel-faa-glpc/14travel-faa-glpc-articleInline.jpg',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'What the F.A.A. Bill Means for Travelers',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
