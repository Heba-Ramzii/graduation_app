import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import '../widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate padding based on screen size
    final logoPaddingTop = screenHeight * 0.1;
    final logoPaddingLeft = screenWidth * 0.25;
    final logoPaddingRight = screenWidth * 0.25;
    final logoPaddingBottom = screenHeight * 0.05;

    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                logoPaddingLeft,
                logoPaddingTop,
                logoPaddingRight,
                logoPaddingBottom,
              ),
              child: Image.asset('assets/images/Logo.png'),
            ),
            const LoginWidget(),
          ],
        ),
      ),
    );
  }
}
