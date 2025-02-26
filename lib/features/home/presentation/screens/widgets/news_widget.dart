import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/features/home/presentation/screens/widgets/news_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews('abc-news'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error',
            style: poppins14(),
          );
        } else {
          var articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => NewsItem(
                articleModel: articles[index],
              ),
            ),
          );
        }
      },
    );
  }
}
