import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/bloc/home_cubit.dart';
import 'package:news/features/home/presentation/bloc/home_states.dart';
import 'package:news/features/home/presentation/screens/widgets/defulat_tab_Widget.dart';

class SourcesWidget extends StatelessWidget {
  const SourcesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return DefulatTabWidget(
          length: HomeCubit.get(context).sources?.sources?.length ?? 0,
          sources: HomeCubit.get(context).sources?.sources ?? [],
        );
      },
    );
  }
}
