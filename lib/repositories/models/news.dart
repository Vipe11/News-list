import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    required String section,
    required String title,
    required String abstract,
    required String source,
    @JsonKey(name: 'updated_date') required String updatedDate,
    @JsonKey(name: 'published_date') required String publishedDate,
    required List<dynamic> multimedia,
  }) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}
