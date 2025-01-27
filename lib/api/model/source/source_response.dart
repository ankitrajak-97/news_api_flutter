import 'package:json_annotation/json_annotation.dart';

part 'source_response.g.dart';

@JsonSerializable()
class SourceResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  SourceResponse({required this.id, required this.name});

  factory SourceResponse.fromJson(Map<String, dynamic> json) => _$SourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}

// run this always when you do some changes in model
// dart run build_runner build --delete-conflicting-outputs
