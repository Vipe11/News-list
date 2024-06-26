part of 'news_list_bloc.dart';

@freezed
class NewsListEvent with _$NewsListEvent {
  const factory NewsListEvent.loadNews({
    Completer? completer,
    String? tag,
    int? limit,
    @Default(true) bool showLoad,
  }) = _LoadNews;
}
