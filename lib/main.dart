import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/home/home_screen.dart';


//heba
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Graduation App',
      theme: ThemeData(
        //primarySwatch: const MaterialColor(ColorsManager.primary),
        iconTheme:const IconThemeData(
          color:ColorsManager.primary,
         )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeDoctorScreen(),
    );
  }
}
