import 'package:flutter/material.dart';
import 'package:news/core/api/sourcesResponse.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';

class TabItem extends StatelessWidget {
  const TabItem({required this.source, required this.isSelected, super.key});

  final Sources source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s18),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        color: isSelected == true
            ? AppColors.primaryColor
            : AppColors.transparnetColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPading.p12),
        child: Text(
          source.name ?? "",
          style: exo14().copyWith(
            color: isSelected == false ? AppColors.primaryColor : null,
          ),
        ),
      ),
    );
  }
}
