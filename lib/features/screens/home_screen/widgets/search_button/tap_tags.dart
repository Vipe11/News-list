import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';

class TapTagListView extends StatelessWidget {
  const TapTagListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tags = [
      'World',
      'Style',
      'Food',
      'New york',
      'En español',
    ];

    return SizedBox(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => TapTags(
                tag: tags[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: tags.length),
    );
  }
}

class TapTags extends StatelessWidget {
  const TapTags({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NewsListBloc>().add(
              NewsListEvent.loadNews(tag: tag),
            );
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: Text(tag)),
      ),
    );
  }
}
