import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {
  final SourcesResponse? sources;
  GetSourcesSuccessState({required this.sources});
}

class GetSourcesErrorState extends HomeStates {
  final String error;
  GetSourcesErrorState({required this.error});
}

class GetNewsLoadingState extends HomeStates {}

class GetNewsSuccessState extends HomeStates {
  final NewsResponse? news;
  GetNewsSuccessState({required this.news});
}

class GetNewsErrorState extends HomeStates {
  final String error;
  GetNewsErrorState({required this.error});
}

class HomeChangeSource extends HomeStates {}

class HomeChangeCategory extends HomeStates {}
