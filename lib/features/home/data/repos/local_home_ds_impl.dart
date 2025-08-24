import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:news/core/caching/cache_sources.dart';
import 'package:news/core/services/api_services.dart';
import 'package:news/features/home/data/repos/home_repo.dart';

class HomeLocalDataImpl implements HomeRepo {
  HomeLocalDataImpl({required this.apiServices});
  final ApiServices apiServices;

  @override
  Future<NewsResponse> getNews(String sourceId) async {
    try {
      final response = await CacheSources.getNews();
      return response!;
    } catch (e) {
      throw Exception('Failed to fetch news $e');
    }
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    try {
      final sources = await CacheSources.getSources();
      return sources!;
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
