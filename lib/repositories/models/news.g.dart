// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      section: json['section'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      source: json['source'] as String,
      updatedDate: json['updated_date'] as String,
      publishedDate: json['published_date'] as String,
      multimedia: json['multimedia'] as List<dynamic>,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'section': instance.section,
      'title': instance.title,
      'abstract': instance.abstract,
      'source': instance.source,
      'updated_date': instance.updatedDate,
      'published_date': instance.publishedDate,
      'multimedia': instance.multimedia,
    };
