import 'package:dio/dio.dart';
import 'package:news/core/utils/constants.dart';

class ApiServices {
  ApiServices({required this.dio});
  final Dio dio;
  final String _baseUrl = AppConstants.baseUrl;
  final String _apiKey = AppConstants.apiKey;

  Future<Map<String, dynamic>> getSources(
      {required String categoryId, required String endpoint}) async {
    var json = await dio.get('$_baseUrl$endpoint', queryParameters: {
      'apiKey': _apiKey,
      'category': categoryId,
      // 'category': categoryId,
    });
    return json.data;
  }

  Future<Map<String, dynamic>> getNews(
      {required String sourceId, required String endpoint}) async {
    var json = await dio.get('$_baseUrl$endpoint', queryParameters: {
      'apiKey': _apiKey,
      'sources': sourceId,
    });
    return json.data;
  }
}
