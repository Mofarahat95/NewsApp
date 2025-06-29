import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as https;
import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:news/core/utils/constants.dart';
import 'package:news/features/categories/presentation/models/category_model.dart';
import 'package:news/features/home/presentation/bloc/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit  get(context) => BlocProvider.of<HomeCubit>(context);
  sourcesResponse? sources;
  NewsResponse? news;
  int selectedIndex = 0;
  String? categoryId;
  CategoryModel? model;

  void getSources() async {
    try {
      emit(GetSourcesLoadingState());
      Uri url = Uri.https(AppConstants.baseUrl, AppConstants.topHeadlineEP, {
        'apikey': AppConstants.apiKey,
        'category': categoryId,
      });
      https.Response response = await https.get(url); 
      var json = jsonDecode(response.body);
      sources = sourcesResponse.fromJson(json);
      emit(GetSourcesSuccessState());
      getNews(sources!.sources![selectedIndex].id ?? "abc-news");
    } catch (e) {
      print(e);
      emit(GetSourcesErrorState());
    }
  }

  void getNews(String sourceId) async {
    try {
      emit(GetNewsLoadingState());
      Uri url = Uri.https(AppConstants.baseUrl, AppConstants.everyThingEP, {
        'apikey': AppConstants.apiKey,
        'sources': sourceId,
      });
      https.Response response = await https.get(url);
      var json = jsonDecode(response.body);
      news = NewsResponse.fromJson(json);
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState());
    }
  }

  void changeSource(int value) {
    selectedIndex = value;
    emit(HomeChangeSource());
    getNews(sources!.sources?[selectedIndex].id ?? '');
  }

  void changeCategory(String id) {
    categoryId = id;
    emit(HomeChangeSource());
    getSources();
  }
}
