import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_icon_button.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 430,
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
              padding: const EdgeInsets.fromLTRB(50, 30, 50, 50),
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: 40,
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
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              type: TextInputType.emailAddress,
              label: "Email",
              hint: "Enter your Email",
              colorFont: ColorsManager.black,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              type: TextInputType.visiblePassword,
              label: "Password",
              suffixPressed: () => {},
              hint: "Enter your password",
              suffixIcon: Icons.remove_red_eye,
              colorFont: ColorsManager.black,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              type: TextInputType.visiblePassword,
              label: "Password",
              suffixPressed: () => {},
              hint: "Enter your password",
              suffixIcon: Icons.remove_red_eye,
              colorFont: ColorsManager.black,
            ),
            SizedBox(
              height: 20,
            ),
            CustomMaterialButton(
              text: "Sign up",
              onPressed: () => {},
            ),
            SizedBox(
              height: 30,
            ),
            Text("Or connect with"),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Stack(
                  children: [
                    Container(
                      width: 145,
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
                SizedBox(
                  width: 80,
                ),
                Stack(
                  children: [
                    Container(
                      width: 145,
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Text("have an account?"),
                CustomTextButton(
                  text: "  Login",
                  onPressed: () => {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
