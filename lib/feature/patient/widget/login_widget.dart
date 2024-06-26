import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/home/main_screen.dart';
import 'package:graduation_app/feature/patient/layout/patient_home_screen.dart';
import 'package:graduation_app/feature/patient/layout/signup_screen.dart';

import '../../../core/core_widgets/custom_outlined_button.dart';
import '../../../core/function/core_function.dart';
import '../../../core/theme_manager/style_manager.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key, required this.isDoctor});
  final bool isDoctor ;


  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04,horizontal: screenWidth * 0.02),
        decoration: ShapeDecoration(
          color: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: ColorsManager.primary,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              label: "Email",
              prefixIcon: Icons.email,
              hint: "Enter your email",
              colorFont: ColorsManager.black,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: passwordController,
              type: TextInputType.visiblePassword,
              label: "Password",
              suffixPressed: () => {},
              hint: "Enter your password",
              suffixIcon: Icons.remove_red_eye,
              colorFont: ColorsManager.black,
            ),
            const SizedBox(height: 20),
            CustomMaterialButton(
              text: "Login",
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  isDoctor ? const MainScreen() : const PatientHome()),
                )
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                text: "Forget Password?",
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              child: Text("Or connect with",
                style: StyleManager.mainTextStyle15.copyWith(
                  color: ColorsManager.grayFont,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.35,
                  height: screenWidth * 0.11,
                  child: CustomOutlineButton(
                    text: "Google ",
                    onPressed:  () {},
                    fontColor: ColorsManager.font,
                    isSvg: true,
                    isIcon: true,
                    iconSvg:"assets/icons/google.svg",
                    color: ColorsManager.background,
                  ),
                ),
                SizedBox(width: screenWidth * 0.04), // Adjusted width
                SizedBox(
                  width: screenWidth * 0.35,
                  height: screenWidth * 0.11,
                  child: CustomOutlineButton(
                    text: "Facebook ",
                    onPressed:  () {},
                    isSvg: true,
                    isIcon: true,
                    fontColor: ColorsManager.font,
                    iconSvg:"assets/icons/facebook.svg",
                    color: ColorsManager.background,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.03), // Adjusted height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: StyleManager.mainTextStyle15.copyWith(
                    color: ColorsManager.grayFont,
                  ),
                ),
                CustomTextButton(
                  text: "  Sign up",
                  onPressed: () => {
                    navigateToScreen(context, SignupScreen(isDoctor: isDoctor,)),
                  },
                ),
              ],
            ),
           ],
        ),
      ),
    );
  }
}
