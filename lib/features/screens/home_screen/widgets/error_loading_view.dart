import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';

class ErrorLoadingView extends StatelessWidget {
  const ErrorLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Произошла ошибка',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Проверьте подключение к интернету',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextButton(
            onPressed: () => context
                .read<NewsListBloc>()
                .add(const NewsListEvent.started()),
            child: Text(
              'Повторить',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.blue,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
