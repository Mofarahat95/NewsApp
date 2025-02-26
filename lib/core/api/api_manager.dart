import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/core/api/sourcesResponse.dart';

class ApiManager {
  static Future<sourcesResponse> getSources() async {
    Uri url = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
      'apikey': 'e29b185e481c425ead8f770104c4d371',
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    sourcesResponse sources = sourcesResponse.fromJson(json);
    return sources;
  }
}
