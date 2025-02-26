import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/config/routes_manager/routes.dart';

void NavigateToHome(BuildContext context) async {
  Future.delayed(
    Duration(seconds: 3),
    () => GoRouter.of(context).go(
      AppRoutes.home,
    ),
  );
}
