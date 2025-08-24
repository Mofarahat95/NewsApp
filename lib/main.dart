import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news/config/routes_manager/routes_manager.dart';
import 'package:news/core/services/services_locator.dart';

import 'features/home/presentation/bloc/observer.dart';

bool isConnected = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connectionChecker = InternetConnectionChecker.instance;
  final subscription = connectionChecker.onStatusChange.listen(
    (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        print('Connected to the internet');
        isConnected = true;
      } else {
        print('Disconnected from the internet');
        isConnected = false;
      }
    },
  );
  setupServicesLocator();
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
