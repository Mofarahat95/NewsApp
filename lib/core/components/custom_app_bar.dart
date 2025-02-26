import 'package:flutter/material.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight * .13,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s50),
          bottomRight: Radius.circular(AppSize.s50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title,
              style: exo22(),
            ),
          ),
        ],
      ),
    );
  }
}
