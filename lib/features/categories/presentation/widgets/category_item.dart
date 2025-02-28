import 'package:flutter/material.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/categories/presentation/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.index, required this.model, super.key});

  final CategoryModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: Container(
        height: context.screenHeight * .12,
        width: context.screenWidth * .06,
        decoration: BoxDecoration(
            color: model.color,
            borderRadius: index.isEven
                ? BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s25),
                    topRight: Radius.circular(AppSize.s25),
                    bottomLeft: Radius.circular(AppSize.s25),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s25),
                    topRight: Radius.circular(AppSize.s25),
                    bottomRight: Radius.circular(AppSize.s25),
                  )),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(model.image),
            ),
            Text(
              model.name,
              style: exo22(),
            ),
            const SizedBox(
              height: AppSize.s26,
            ),
          ],
        ),
      ),
    );
  }
}
