import 'package:flutter/material.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/home/presentation/screens/widgets/drawer_widget.dart';

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
          bottomLeft: Radius.circular(AppSize.s38),
          bottomRight: Radius.circular(AppSize.s38),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                DrawerWidget();
              },
              icon: Icon(
                Icons.menu_outlined,
                color: AppColors.whiteColor,
                size: AppSize.s30,
              ),
            ),
            Center(
              child: Text(
                title,
                style: exo22(),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: AppColors.whiteColor,
                size: AppSize.s30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
