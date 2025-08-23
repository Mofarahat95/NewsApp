import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String categoryId);
  Future<NewsResponse> getNews(String sourceId);
  void changeSource(int value);
  void changeCategory(String id);
}
