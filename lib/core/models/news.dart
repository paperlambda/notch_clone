import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  News({
    required this.id,
    required this.category,
    required this.title,
    required this.publishedAt,
    required this.thumbnail,
    required this.content,
    required this.author,
  });

  final String id;
  final String category;
  final String title;
  final DateTime publishedAt;
  final String thumbnail;
  final String content;
  final String author;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}