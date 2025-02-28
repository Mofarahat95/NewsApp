import 'dart:ui';

import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.id,
    required this.color,
    required this.image,
  });

  final String name;
  final String id;
  final Color color;
  final String image;

  static getCategories() {
    return [
      CategoryModel(
        name: 'Sports',
        id: 'sports',
        color: AppColors.redColor,
        image: AppAssets.sportImage,
      ),
      CategoryModel(
        name: 'Technology',
        id: 'technology',
        color: AppColors.blueColor,
        image: AppAssets.technologyImage,
      ),
      CategoryModel(
        name: 'Health',
        id: 'health',
        color: AppColors.pinkColor,
        image: AppAssets.healthImage,
      ),
      CategoryModel(
        name: 'Business',
        id: 'business',
        color: AppColors.brownColor,
        image: AppAssets.bussinesImage,
      ),
      CategoryModel(
        name: 'general',
        id: 'general',
        color: AppColors.ligthBlueColor,
        image: AppAssets.bussinesImage,
      ),
      CategoryModel(
        name: 'Sciences',
        id: 'science',
        color: AppColors.yallowColor,
        image: AppAssets.scienceImage,
      ),
    ];
  }
}
