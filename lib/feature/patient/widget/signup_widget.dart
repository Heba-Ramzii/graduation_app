import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_icon_button.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/layout/login_screen.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: screenWidth * 0.9, // Adjusted width
          height: 550,
          decoration: ShapeDecoration(
            color: ColorsManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.115, // Adjusted left padding
                30,
                screenWidth * 0.115, // Adjusted right padding
                50,
              ),
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: screenWidth * 0.06, // Adjusted font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              type: TextInputType.name,
              label: "name",
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
              suffixIcon: Icons.remove_red_eye,
              colorFont: ColorsManager.black,
            ),
            SizedBox(height: screenWidth * 0.02), // Adjusted height
            CustomTextFormField(
              controller: TextEditingController(),
              type: TextInputType.visiblePassword,
              label: "Password",
              suffixPressed: () => {},
              hint: "Enter your password",
              suffixIcon: Icons.remove_red_eye,
              colorFont: ColorsManager.black,
            ),
            SizedBox(height: screenWidth * 0.02), // Adjusted height
            CustomMaterialButton(
              text: "Sign up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return LoginScreen();
                  }),
                );
              },
            ),
            SizedBox(height: screenWidth * 0.03), // Adjusted height
            const Text("Or connect with"),
            SizedBox(height: screenWidth * 0.03), // Adjusted height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: screenWidth * 0.3, // Adjusted width
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 10),
                      decoration: ShapeDecoration(
                        color: ColorsManager.background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: CustomIconButton(
                        onPressed: () {},
                        iconSize: 20,
                        icon: "assets/icons/facebook.svg",
                        text: ("Facebook"),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.1), // Adjusted width
                Stack(
                  children: [
                    Container(
                      width: screenWidth * 0.3, // Adjusted width
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 10),
                      decoration: ShapeDecoration(
                        color: ColorsManager.background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: CustomIconButton(
                        onPressed: () {},
                        iconSize: 20,
                        icon: "assets/icons/google.svg",
                        text: ("Google"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.02), // Adjusted height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("have an account?"),
                CustomTextButton(
                  text: "  Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
