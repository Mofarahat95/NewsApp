import 'package:flutter/material.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/categories/presentation/models/category_model.dart';
import 'package:news/features/categories/presentation/widgets/category_item.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.onClick, super.key});

  final Function onClick;

  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategories();
    return Column(
      children: [
        CustomAppBar(title: 'NewsApp'),
        Text(
          'Pick your categories of interest',
          style: poppins22(),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              padding: EdgeInsets.all(AppPading.p12),
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      onClick(categories[index]);
                    },
                    child: CategoryItem(
                      model: categories[index],
                      index: index,
                    ),
                  )),
        ),
      ],
    );
  }
}
