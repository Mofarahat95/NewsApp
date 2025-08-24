import 'dart:io';

import 'package:hive/hive.dart';
import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:path_provider/path_provider.dart';

class CacheSources {
  static Future<void> saveSources(
      SourcesResponse? sources, NewsResponse? news) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'newsAppV1',
      {'sources', 'news'},
      path: appDirectory.path,
    );
    final sourcesBox = await collection.openBox<Map>('sources');
    final newsBox = await collection.openBox<Map>('sources');
    await sourcesBox.put('sources', sources?.toJson() ?? {});
    await newsBox.put('news', news?.toJson() ?? {});
  }

  static Future<void> saveNews(NewsResponse news) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'newsAppV1',
      {'sources', 'news'},
      path: appDirectory.path,
    );
    final newsBox = await collection.openBox<Map>('news');
    await newsBox.put('news', news.toJson());
  }

  static Future<SourcesResponse?> getSources() async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'newsAppV1',
      {'sources', 'news'},
      path: appDirectory.path,
    );
    final sourcesBox = await collection.openBox<Map>('sources');
    final response = await sourcesBox.get('sources');
    return SourcesResponse.fromJson(response!);
  }

  static Future<NewsResponse> getNews() async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'newsAppV1',
      {'sources', 'news'},
      path: appDirectory.path,
    );
    final newsBox = await collection.openBox<Map>('news');
    final response = await newsBox.get('news');
    return NewsResponse.fromJson(response!);
  }
}
