import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/api/news_response.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetialsScreen extends StatelessWidget {
  const NewsDetialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var article = GoRouterState.of(context).extra as Articles;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            article.title?.substring(0, 20) ?? 'NewsTitle',
            style: exo22(),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSize.s25),
            ),
          )),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s5),
                child: Image.network(article.urlToImage ?? "")),
            Text(
              article.source?.name ?? "",
              style: poppins10(),
            ),
            Text(
              article.title ?? "",
              style: poppins14(),
            ),
            Text(
              textAlign: TextAlign.right,
              article.publishedAt?.substring(0, 10) ?? "",
              style: inter13(),
            ),
            Text(
              article.description ?? "empty",
              style: poppins13(),
            ),
            InkWell(
              onTap: () {
                _launchUrl(article.url ?? "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View Full Article', style: poppins14()),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
