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
    on<_Started>(_startApp);
    on<_SearchFromTag>(_serchFromTagApp);
  }

  _serchFromTagApp(_SearchFromTag event, Emitter<NewsListState> emit) async {
    emit(const _Loading());
    try {
      var newsList = await newsRepository.getNewsAboutTags(tag: event.tag);
      emit(_Loaded(newsList: newsList));
    } on DioException catch (e) {
      emit(_Error(e: e.type));
    }
  }

  _startApp(_Started event, Emitter<NewsListState> emit) async {
    if (state is! _Loaded) {
      emit(const _Loading());
    }

    try {
      var newsList = await newsRepository.getNewsList();
      emit(_Loaded(newsList: newsList));
    } on DioException catch (e) {
      emit(_Error(e: e.type));
    } finally {
      event.completer?.complete();
    }
  }

  final InterfaceNewsRepository newsRepository;
}
