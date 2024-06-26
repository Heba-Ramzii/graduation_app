import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/home/home_screen.dart';
import 'package:graduation_app/generated/assets.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user ;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        this.user = null;
      } else {
        this.user = user;
        debugPrint('User is signed in!');
      }
    });
  }
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
          nextScreen:  user == null ? const OnboardingScreen() : const HomeDoctorScreen(),
        ),
    );
  }
}