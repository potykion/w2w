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
