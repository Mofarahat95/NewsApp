import 'package:flutter/material.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/categories/presentation/models/category_model.dart';
import 'package:news/features/categories/presentation/screens/category_screen.dart';
import 'package:news/features/home/presentation/screens/widgets/drawer_widget.dart';
import 'package:news/features/news/presentation/widgets/news_widget.dart';
import 'package:news/features/news/presentation/widgets/sources_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(image: AssetImage(AppAssets.bgImage)),
      ),
      child: Scaffold(
        drawer: const DrawerWidget(),
        body: model == null
            ? CategoryScreen(
          onClick: selectedCategory,
        )
            : Column(
          children: [
            CustomAppBar(title: 'NewsApp'),
            const SizedBox(
              height: AppSize.s8,
            ),
            SourcesWidget(
              categoryId: model!.id,
            ),
            NewsWidget(),
          ],
        ),
      ),
    );
  }

  CategoryModel? model;

  selectedCategory(cat) {
    model = cat;
    setState(() {});
  }
}
