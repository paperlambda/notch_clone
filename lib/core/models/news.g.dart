// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      thumbnail: json['thumbnail'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnail': instance.thumbnail,
      'content': instance.content,
      'author': instance.author,
    };
