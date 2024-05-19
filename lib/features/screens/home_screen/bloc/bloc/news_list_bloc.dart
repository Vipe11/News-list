import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_list/repositories/models/news.dart';
import 'package:news_list/repositories/news_repository/interface_news_repository.dart';

part 'news_list_bloc.freezed.dart';
part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc(this.newsRepository) : super(const _Initial()) {
    on<_LoadNews>(_startLoad);
  }

  _startLoad(_LoadNews event, Emitter<NewsListState> emit) async {
    if (event.showLoad) {
      emit(const _Loading());
    }

    try {
      var newsList = await newsRepository.getNewsList(
        tag: event.tag,
        limit: event.limit,
      );
      emit(_Loaded(
        newsList: newsList,
        tag: event.tag,
        limit: event.limit,
      ));
    } on DioException catch (e) {
      emit(_Error(
        e: e.type,
        tag: event.tag,
        limit: event.limit,
      ));
    } finally {
      event.completer?.complete();
    }
  }

  final InterfaceNewsRepository newsRepository;
}
