import 'package:flutter/material.dart';
import 'package:news/core/utils/styles_manager.dart';
import 'package:news/core/utils/values_manager.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {required this.title,
      required this.icon,
      required this.onClick,
      super.key});

  final String title;
  final IconData icon;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Row(
        spacing: AppSize.s5,
        children: [
          Icon(
            icon,
          ),
          Text(
            title,
            style: poppins24(),
          ),
        ],
      ),
    );
  }
}
