import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news/core/components/custom_app_bar.dart';
import 'package:news/core/services/services_locator.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/values_manager.dart';
import 'package:news/features/categories/presentation/screens/category_screen.dart';
import 'package:news/features/home/data/repos/home_remote_ds_impl.dart';
import 'package:news/features/home/data/repos/local_home_ds_impl.dart';
import 'package:news/features/home/presentation/bloc/home_cubit.dart';
import 'package:news/features/home/presentation/bloc/home_states.dart';
import 'package:news/features/home/presentation/screens/widgets/drawer_widget.dart';
import 'package:news/features/news/presentation/widgets/news_widget.dart';
import 'package:news/features/news/presentation/widgets/sources_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
          homeRepo: false
              ? getIt.get<HomeRemoteDataImpl>()
              : getIt.get<HomeLocalDataImpl>())
        ..getSources(),
      child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
        if (state is GetSourcesErrorState || state is GetNewsErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text('error'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
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
