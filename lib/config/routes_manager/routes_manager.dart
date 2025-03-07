import 'package:go_router/go_router.dart';
import 'package:news/config/routes_manager/routes.dart';
import 'package:news/core/api/news_response.dart';
import 'package:news/features/home/presentation/screens/home_screen.dart';
import 'package:news/features/news/presentation/screens/news_detials_screen.dart';
import 'package:news/features/settings/presentation/screens/settings_screen.dart';
import 'package:news/features/splash/presentation/screens/splash_screen.dart';

abstract class RoutesManager {
  static final GoRouter routers = GoRouter(routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
        path: AppRoutes.newsDetails,
        builder: (context, state) {
          Articles article = state.extra as Articles;
          return const NewsDetialsScreen();
        })
  ]);
}
