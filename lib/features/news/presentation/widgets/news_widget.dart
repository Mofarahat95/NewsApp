import 'package:flutter/material.dart';
import 'package:news/features/home/presentation/bloc/cubit.dart';
import 'package:news/features/news/presentation/widgets/news_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var articles = HomeCubit.get(context).news?.articles;
    return Expanded(
      child: ListView.builder(
        itemCount: articles?.length ?? 0,
        itemBuilder: (context, index) => NewsItem(
          articleModel: articles![index],
        ),
      ),
    );
  }
}
