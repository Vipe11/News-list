part of 'news_list_bloc.dart';

@freezed
class NewsListState with _$NewsListState {
  const factory NewsListState.initial() = _Initial;
  const factory NewsListState.loading() = _Loading;
  const factory NewsListState.loaded({
    required List<News> newsList,
    String? tag,
    int? limit,
  }) = _Loaded;
  const factory NewsListState.error({
    Object? e,
    String? tag,
    int? limit,
  }) = _Error;
}
