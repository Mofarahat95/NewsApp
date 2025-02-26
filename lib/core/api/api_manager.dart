import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:news/core/utils/constants.dart';

class ApiManager {
  static Future<sourcesResponse> getSources() async {
    Uri url = Uri.https(AppConstants.baseUrl, AppConstants.topHeadlineEP, {
      'apikey': AppConstants.apiKey,
    });
    https.Response response = await https.get(url);
    var json = jsonDecode(response.body);
    sourcesResponse sources = sourcesResponse.fromJson(json);
    return sources;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(AppConstants.baseUrl, AppConstants.everyThingEP, {
      'apikey': AppConstants.apiKey,
      'sources': sourceId,
    });
    https.Response response = await https.get(url);
    var json = jsonDecode(response.body);
    NewsResponse news = NewsResponse.fromJson(json);
    print(news.articles?.length);
    return news;
  }
}
