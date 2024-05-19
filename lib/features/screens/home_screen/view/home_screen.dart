import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';
import 'package:news_list/features/screens/home_screen/widgets/widgets.dart';
import 'package:news_list/features/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<NewsListBloc>().add(const NewsListEvent.loadNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewsListBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SearchButton(),
        title: const Text('News List'),
        actions: const [
          ChangeButtonTheme(),
        ],
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<NewsListBloc, NewsListState>(
        bloc: bloc,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Not init...'),
            ),
            loading: () => ListView.separated(
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) => const NewsContainerShimmer(),
              itemCount: 5,
            ),
            loaded: (newsList) {
              return RefreshIndicator(
                onRefresh: () async {
                  final completer = Completer();
                  context.read<NewsListBloc>().add(NewsListEvent.loadNews(
                        completer: completer,
                        showLoad: false,
                      ));
                  return completer.future;
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) => NewsContainer(
                    news: newsList[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: newsList.length,
                ),
              );
            },
            error: (e) => ErrorLoadingView(e: e),
          );
        },
      ),
    );
  }
}
