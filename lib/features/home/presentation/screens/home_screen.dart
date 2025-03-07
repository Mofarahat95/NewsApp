import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/categories/presentation/screens/category_screen.dart';
import 'package:news/features/home/presentation/bloc/cubit.dart';
import 'package:news/features/home/presentation/bloc/home_bloc.dart';
import 'package:news/features/home/presentation/screens/widgets/drawer_widget.dart';
import 'package:news/features/news/presentation/widgets/news_widget.dart';
import 'package:news/features/news/presentation/widgets/sources_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
        if (state is GetSourcesErrorState || state is GetNewsErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Error')));
        }
      }, builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            image: DecorationImage(image: AssetImage(AppAssets.bgImage)),
          ),
          child:
              (state is GetSourcesLoadingState || state is GetNewsLoadingState)
                  ? Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColors.primaryColor,
                        size: 50,
                      ),
                    )
                  : Scaffold(
                      drawer: const DrawerWidget(),
                      body: HomeCubit.get(context).categoryId == null
                          ? CategoryScreen()
                          : Column(
                              children: [
                                CustomAppBar(title: 'NewsApp'),
                                const SizedBox(height: AppSize.s8),
                                SourcesWidget(),
                                NewsWidget(),
                              ],
                            ),
                    ),
        );
      }),
    );
  }
}
