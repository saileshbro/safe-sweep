import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:safesweep/constants/app_images.dart';
import 'package:safesweep/features/home/home_view.dart';
import 'package:safesweep/features/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late Animation<double> logoAnimation;
  late AnimationController logoController;
  late AnimationStatus current;

  @override
  void dispose() {
    logoController.dispose();
    super.dispose();
  }

  void moveToNextScreen() {
    Future.delayed(const Duration(milliseconds: 1250), () async {
      final hasPermissions = await DevicePolicyManager.isPermissionGranted();
      if (hasPermissions) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingView(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    moveToNextScreen();

    logoController = AnimationController(
      duration: const Duration(milliseconds: 1250),
      vsync: this,
    );

    logoAnimation = Tween(begin: 0.35, end: 0.5).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut,
      ),
    );

    logoController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: logoAnimation,
            builder: (context, child) {
              return Image.asset(
                AppImages.logo,
                width: MediaQuery.of(context).size.width * logoAnimation.value,
              );
            }),
      ),
    );
  }
}
