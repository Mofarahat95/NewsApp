import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/config/routes_manager/routes.dart';
import 'package:news/core/api/news_response.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({required this.articleModel, super.key});

  final Articles articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.newsDetails, extra: articleModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s18),
                child: Image.network(
                  articleModel.urlToImage ?? '',
                  height: 240,
                ),
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
              Text(
                articleModel.source?.name ?? 'source',
                style: poppins10(),
                textAlign: TextAlign.left,
              ),
              Text(
                articleModel.title ?? 'title',
                style: poppins14(),
                maxLines: 4,
              ),
              Text(
                articleModel.publishedAt?.substring(0, 10) ?? 'publishedAt',
                style: poppins13(),
                textAlign: TextAlign.right,
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
