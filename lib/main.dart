import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:news_list/app.dart';
import 'package:news_list/repositories/news_repository/interface_news_repository.dart';
import 'package:news_list/repositories/news_repository/news_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ScrollController scrollController = ScrollController();

  GetIt.I.registerLazySingleton<InterfaceNewsRepository>(
    () => NewsRepository(dio: Dio()),
  );
  GetIt.I.registerLazySingleton(() => scrollController);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}
