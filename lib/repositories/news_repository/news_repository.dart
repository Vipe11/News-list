import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_list/repositories/models/news.dart';
import 'package:news_list/repositories/news_repository/interface_news_repository.dart';

class NewsRepository implements InterfaceNewsRepository {
  NewsRepository({required this.dio});

  final Dio dio;

  final String host = 'https://api.nytimes.com/svc/news/v3/content';
  final String allNews = '/all/all.json?api-key=';
  final String apiKey = 'KbtDtizOkvF5Aa3BkXDzpHNAzvkS6h5G';

  @override
  Future<List<News>> getNewsList() async {
    final response = await dio.get('$host$allNews$apiKey');

    debugPrint('Запрос отправлен...');

    final data = response.data;
    final dataResults = data['results'] as List<dynamic>;

    final newsList = [for (var i in dataResults) News.fromJson(i)];

    debugPrint(newsList.toString());

    return (newsList);
  }
}
