import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/http.dart';
import '../domain/models.dart';

part 'remote.g.dart';

@RestApi(baseUrl: "http://84.201.135.199:8098/")
abstract class ClothingRestClient {
  factory ClothingRestClient(Dio dio, {String baseUrl}) = _ClothingRestClient;

  @GET("/clothing/parse")
  Future<Clothing> parseLamodaClothing(@Query("url") String url);

  @POST("/upload_image_via_file")
  Future<UrlDto> uploadImageViaFile(@Part() File image);

  @POST("/upload_image_via_link")
  Future<UrlDto> uploadImageViaLink(@Body() UrlDto dto);

  @POST("/clothing/create")
  Future<Clothing> createClothing(
    @Part() String title,
    @Part() String type,
    @Part() String color,
    @Part() List<String> imageUrls,
    @Part() List<File> imageFiles,
  );

  @POST("/clothing/create")
  Future<Clothing> updateClothing(
    @Part() int id,
    @Part() String title,
    @Part() String type,
    @Part() String color,
    @Part() List<String> imageUrls,
    @Part() List<File> imageFiles,
  );
}


@JsonSerializable()
class UrlDto {
  final String url;

  UrlDto(this.url);

  factory UrlDto.fromJson(Map<String, dynamic> json) => _$UrlDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UrlDtoToJson(this);
}
