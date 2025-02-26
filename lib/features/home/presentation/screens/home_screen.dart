import 'package:flutter/material.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/home/presentation/screens/widgets/news_widget.dart';
import 'package:news/features/home/presentation/screens/widgets/sources_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(image: AssetImage(AppAssets.bgImage)),
      ),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'NewsApp'),
            const SizedBox(height: AppSize.s8,),
            SourcesWidget(),
            NewsWidget(),
          ],
        ),
      ),
    );
  }
}
