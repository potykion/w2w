import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/http.dart';
import 'package:w2w/core/state/view_models.dart';
import '../domain/models.dart';

part 'api_clients.g.dart';

class LamodaParseApiClient {
  Future<Clothing> call(String lamodaLink) async {
    var url = Uri(
      scheme: "http",
      host: "84.201.135.199",
      port: 8098,
      path: "/",
      queryParameters: {"url": lamodaLink},
    );
    var resp = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    var clothing = Clothing.fromJson(json);
    return clothing;
  }
}

/// Возвращает шмотку по ссылке: https://lamoda.ru/p/he002emklgv2
class FakeLamodaParseApiClient implements LamodaParseApiClient {
  @override
  Future<Clothing> call(String lamodaLink) async {
    return Clothing(
      title: "Mango Man CHERLO",
      type: "Футболка",
      images: [
        "https://a.lmcdn.ru/img600x866/H/E/HE002EMKLGV2_11830316_1_v1.jpg",
        "https://a.lmcdn.ru/img600x866/H/E/HE002EMKLGV2_11830318_3_v1.jpg",
        "https://a.lmcdn.ru/img600x866/H/E/HE002EMKLGV2_11830317_2_v1.jpg"
      ],
    );
  }
}

@RestApi(baseUrl: "http://84.201.135.199:8098/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/parse")
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
