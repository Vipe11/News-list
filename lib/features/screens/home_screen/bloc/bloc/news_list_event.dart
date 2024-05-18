part of 'news_list_bloc.dart';

@freezed
class NewsListEvent with _$NewsListEvent {
  const factory NewsListEvent.started({Completer? completer}) = _Started;
  const factory NewsListEvent.searchFromTag({required String tag}) = _SearchFromTag;
}
