import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/api/model/article/article_response.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'totalResults')
  final int? resultCount;

  @JsonKey(name: 'articles')
  final List<ArticleResponse> articleList;

  BaseResponse({
    required this.status,
    required this.resultCount,
    required this.articleList,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
