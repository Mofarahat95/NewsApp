import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:news/core/caching/cache_sources.dart';
import 'package:news/core/services/api_services.dart';
import 'package:news/core/utils/constants.dart';
import 'package:news/features/home/data/repos/home_repo.dart';

class HomeRemoteDataImpl implements HomeRepo {
  HomeRemoteDataImpl({required this.apiServices});
  final ApiServices apiServices;

  @override
  Future<NewsResponse> getNews(String sourceId) async {
    try {
      final Map<String, dynamic> data = await apiServices.getNews(
          sourceId: sourceId, endpoint: AppConstants.everyThingEP);
      NewsResponse news = NewsResponse.fromJson(data);
      CacheSources.saveNews(news);
      return news;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    try {
      final Map<String, dynamic> data = await apiServices.getSources(
          categoryId: categoryId, endpoint: AppConstants.sources);
      SourcesResponse sources = SourcesResponse.fromJson(data);
      CacheSources.saveSources(sources, null);
      return sources;
    } catch (e) {
      throw Exception('Failed to fetch sources: $e');
    }
  }

  @override
  void changeCategory(String id) {
    throw UnimplementedError('changeCategory not implemented');
  }

  @override
  void changeSource(int value) {
    throw UnimplementedError('changeSource not implemented');
  }
}
