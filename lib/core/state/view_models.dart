import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_models.g.dart';

@JsonSerializable()
class UrlDto {
  final String url;

  UrlDto(this.url);

  factory UrlDto.fromJson(Map<String, dynamic> json) => _$UrlDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UrlDtoToJson(this);
}
