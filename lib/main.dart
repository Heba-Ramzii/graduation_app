import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/home/home_screen.dart';
import 'package:graduation_app/layout/patient_home_screen.dart';
import 'package:graduation_app/layout/schedule_screen.dart';
import 'package:graduation_app/layout/schedule_screen_2.dart';
import 'package:graduation_app/layout/search_patient_screen.dart';

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
        useMaterial3: false,
        iconTheme: const IconThemeData(
          color: ColorsManager.primary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: ColorsManager.primaryMaterialColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScheduleSreen2(),
    );
  }
}
