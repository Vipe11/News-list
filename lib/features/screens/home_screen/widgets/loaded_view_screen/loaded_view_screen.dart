import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';
import 'package:news_list/features/screens/home_screen/widgets/widgets.dart';
import 'package:news_list/repositories/models/news.dart';

class LoadedViewScreen extends StatefulWidget {
  const LoadedViewScreen({
    super.key,
    required this.newsList,
    required this.tag,
    this.limit,
  });

  final List<News> newsList;
  final String? tag;
  final int? limit;

  @override
  State<LoadedViewScreen> createState() => _LoadedViewScreenState();
}

class _LoadedViewScreenState extends State<LoadedViewScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<NewsListBloc>().add(
            NewsListEvent.loadNews(
              showLoad: false,
              tag: widget.tag,
              limit: _limitCount(widget.limit),
            ),
          );
    }
  }

  int _limitCount(int? limit) {
    if (limit != null) {
      if (limit < 500) {
        return limit + 20;
      }
      return limit;
    }
    return 20;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        context.read<NewsListBloc>().add(NewsListEvent.loadNews(
              completer: completer,
              showLoad: false,
              tag: widget.tag,
              limit: widget.limit,
            ));
        return completer.future;
      },
      child: ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          if (index == widget.newsList.length) {
            return const Column(
              children: [
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            );
          }
          return NewsContainer(
            news: widget.newsList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: widget.newsList.length + 1,
      ),
    );
  }
}
