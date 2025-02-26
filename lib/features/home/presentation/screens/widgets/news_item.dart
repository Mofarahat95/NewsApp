import 'package:flutter/material.dart';
import 'package:news/core/api/news_response.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({required this.articleModel, super.key});

  final Articles articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Column(
          spacing: AppSize.s5,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s18),
              child: Image.network(
                articleModel.urlToImage ?? '',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Text(
              textAlign: TextAlign.left,
              articleModel.source?.name ?? 'source',
              style: poppins10(),
            ),
            Text(
              articleModel.title ?? 'title',
              style: poppins14(),
              maxLines: 4,
            ),
            Text(
              textAlign: TextAlign.right,
              articleModel.publishedAt?.substring(0,10) ?? 'publishedAt',
              style: poppins13(),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
          ],
        ),
      ),
    );
  }
}
