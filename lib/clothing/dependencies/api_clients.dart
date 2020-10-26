import 'dart:convert';

import 'package:http/http.dart' as http;
import '../domain/models.dart';

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
