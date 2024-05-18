import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/generated/assets.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          animationDuration: const Duration(milliseconds: 2000),
           centered : true,
          backgroundColor:ColorsManager.primary,
          splash: Assets.imagesDoctorAssistant1,
          splashIconSize: 100,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen:  const OnboardingScreen(),
        ),
    );
  }
}