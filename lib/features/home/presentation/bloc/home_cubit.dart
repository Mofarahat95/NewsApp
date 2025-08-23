import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/api/news_response.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:news/features/categories/presentation/models/category_model.dart';
import 'package:news/features/home/data/repos/home_repo.dart';
import 'package:news/features/home/presentation/bloc/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  NewsResponse? news;
  SourcesResponse? sources;
  int selectedIndex = 0;
  String? categoryId;
  CategoryModel? model;

  void getSources() async {
    try {
      emit(GetSourcesLoadingState());
      sources = await homeRepo.getSources(categoryId ?? "general");
      emit(GetSourcesSuccessState(sources: sources));
      getNews(sources!.sources![selectedIndex].id ?? "abc-news");
    } catch (e) {
      emit(GetSourcesErrorState(error: e.toString()));
    }
  }

  void getNews(String sourceId) async {
    try {
      emit(GetNewsLoadingState());
      news = await homeRepo.getNews(sourceId);
      emit(GetNewsSuccessState(news: news));
    } catch (e) {
      emit(GetNewsErrorState(error: e.toString()));
    }
  }

  void changeSource(int value) {
    selectedIndex = value;
    emit(HomeChangeSource());
    getNews(sources!.sources?[selectedIndex].id ?? '');
  }

  void changeCategory(String id) {
    categoryId = id;
    // emit(HomeChangeSource());
    getSources();
  }
}
