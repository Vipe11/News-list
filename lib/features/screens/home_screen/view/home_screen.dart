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
    context.read<NewsListBloc>().add(const NewsListEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewsListBloc>();
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
      body: BlocBuilder<NewsListBloc, NewsListState>(
        bloc: bloc,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Not init...'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (newsList) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) => NewsContainer(
                  news: newsList[index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: newsList.length,
              );
            },
            error: () => const ErrorLoadingView(),
          );
        },
      ),
    );
  }
}
