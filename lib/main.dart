import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/config/routes_manager/routes_manager.dart';

import 'features/home/presentation/bloc/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.routers,
    );
  }
}
