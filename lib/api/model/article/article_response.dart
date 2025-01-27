import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/api/model/source/source_response.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: 'source')
  final SourceResponse? source;

  @JsonKey(name: 'author')
  final String? author;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? desc;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'urlToImage')
  final String? urlImg;

  @JsonKey(name: 'publishedAt')
  final String? publishedAt;

  ArticleResponse({
    required this.source,
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlImg,
    required this.publishedAt,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
