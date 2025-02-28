import 'package:flutter/material.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/features/news/presentation/widgets/tab_item.dart';

class DefulatTabWidget extends StatefulWidget {
  const DefulatTabWidget({
    required this.length,
    required this.sources,
    super.key,
  });

  final int length;
  final List<dynamic> sources;

  @override
  State<DefulatTabWidget> createState() => _DefulatTabWidgetState();
}

class _DefulatTabWidgetState extends State<DefulatTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.length,
      child: TabBar(
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        dividerColor: AppColors.transparnetColor,
        indicatorColor: AppColors.transparnetColor,
        isScrollable: true,
        tabs: widget.sources
            .map((e) => TabItem(
                  isSelected: widget.sources[selectedIndex] == e ? true : false,
                  source: e,
                ))
            .toList(),
      ),
    );
  }
}
