import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import '../widget/signup_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, required this.isDoctor,});
  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.06), // Adjusted padding
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              width: screenWidth * 0.5, // Adjusted image width
              height: screenWidth * 0.5, // Adjusted image height
            ),
             SignupWidget(isDoctor: isDoctor,),
          ],
        ),
      ),
    );
  }
}
