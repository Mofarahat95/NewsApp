import 'package:go_router/go_router.dart';
import 'package:news/config/routes_manager/routes.dart';
import 'package:news/features/splash/presentation/screens/splash_screen.dart';

abstract class RoutesManager {
  static final GoRouter routers = GoRouter(routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    )
  ]);
}
