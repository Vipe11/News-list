import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';

class ErrorLoadingView extends StatelessWidget {
  const ErrorLoadingView({
    super.key,
    this.e,
    this.tag,
    this.limit,
  });

  final Object? e;
  final String? tag;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    String showMessageFromErr(Object? e) {
      switch (e) {
        case DioExceptionType.connectionError:
          return 'Проверьте подключение к интернету';
        case DioExceptionType.connectionTimeout:
          return 'Долгое соединение с сервером';
        default:
          return 'Попробуйте перезагрузить приложение';
      }
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Произошла ошибка',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            showMessageFromErr(e),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextButton(
            onPressed: () =>
                context.read<NewsListBloc>().add(NewsListEvent.loadNews(
                      tag: tag,
                      limit: limit,
                    )),
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
