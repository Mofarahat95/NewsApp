import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/categories/presentation/models/category_model.dart';
import 'package:news/features/categories/presentation/widgets/category_item.dart';
import 'package:news/features/home/presentation/bloc/cubit.dart';
import 'package:news/features/home/presentation/bloc/home_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getCategories();
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) => Column(
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
                        HomeCubit.get(context)
                            .changeCategory(categories[index].id);
                      },
                      child: CategoryItem(
                        model: categories[index],
                        index: index,
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
