import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/features/home/presentation/screens/widgets/defulat_tab_Widget.dart';

class SourcesWidget extends StatelessWidget {
  const SourcesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          print('error');
          return Text(
            'Error',
            style: poppins14(),
          );

        } else {
          var sources = snapshot.data?.sources ?? [];
          print(sources.length);
          return DefulatTabWidget(length: sources.length, sources: sources);
        }
      },
    );
  }
}
