import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import 'feature/doctor/pages/doctor_clinics/clinic.dart';
import 'feature/doctor/pages/home/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduation App',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          color: ColorsManager.white,
        ),
        primaryColor: ColorsManager.primaryMaterialColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.primaryMaterialColor,
        ),
         iconTheme: const IconThemeData(
          color: ColorsManager.primary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: ColorsManager.primaryMaterialColor,
       ),
      debugShowCheckedModeBanner: false,
      home: const HomeDoctorScreen(),
    );
  }
}
