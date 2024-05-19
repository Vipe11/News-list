import 'package:news_list/repositories/models/news.dart';

abstract interface class InterfaceNewsRepository {
  Future<List<News>> getNewsList({String? tag, int? limit});
}
