import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/config/routes_manager/routes.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/home/presentation/bloc/home_cubit.dart';
import 'package:news/features/home/presentation/screens/widgets/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      width: context.screenWidth * .7,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            height: context.screenHeight * .2,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSize.s16),
                bottomRight: Radius.circular(AppSize.s16),
              ),
            ),
            child: Center(
              child: Text(
                'NewsApp!',
                style: poppins22().copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: AppSize.s8,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DrawerItem(
                      title: 'Categories',
                      icon: Icons.auto_awesome_mosaic_outlined,
                      onClick: () {
                        HomeCubit.get(context).categoryId = null;
                        GoRouter.of(context).push(AppRoutes.home);
                      },
                    ),
                    DrawerItem(
                      title: 'Settings',
                      icon: Icons.settings,
                      onClick: () {
                        GoRouter.of(context).push(AppRoutes.settings);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
