import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_outlined_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';

import '../../../core/theme_manager/style_manager.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key, required this.isDoctor});
  final bool isDoctor  ;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
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
              Text(
                'Sign up',
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: screenWidth * 0.06, // Adjusted font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                type: TextInputType.name,
                label: "Name",
                hint: "Enter your name",
                colorFont: ColorsManager.black,
              ),
              SizedBox(height: screenWidth * 0.02), // Adjusted height
              CustomTextFormField(
                controller: TextEditingController(),
                type: TextInputType.emailAddress,
                label: "Email",
                hint: "Enter your Email",
                colorFont: ColorsManager.black,
              ),
              SizedBox(height: screenWidth * 0.02), // Adjusted height
              CustomTextFormField(
                controller: TextEditingController(),
                type: TextInputType.visiblePassword,
                label: "Password",
                suffixPressed: () => {},
                hint: "Enter your password",
                suffixIcon: Icons.remove_red_eye_outlined,
                colorFont: ColorsManager.black,
              ),
              SizedBox(height: screenWidth * 0.02), // Adjusted height
              CustomMaterialButton(
                text: "Sign up",
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen(isDoctor:isDoctor,)),
                  )
                },
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
                      "have an account ?",
                    style: StyleManager.mainTextStyle15.copyWith(
                      color: ColorsManager.grayFont,
                    ),
                  ),
                  CustomTextButton(
                    text: "  Login",
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginScreen(isDoctor: isDoctor,)),
                      )
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
