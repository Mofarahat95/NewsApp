import 'package:flutter/material.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/features/splash/presentation/widgets/navigate_to.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.bgImage,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(AppAssets.logoImage),
          ),
        ],
      ),
    );
  }
}
