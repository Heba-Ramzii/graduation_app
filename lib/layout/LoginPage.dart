import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_icon_button.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

//login test
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            color: ColorsManager.primaryLight,
            height: 800,
            width: 360,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 80, 60, 45),
                child: Image(
                  width: 240,
                  height: 120,
                  image: AssetImage("assets/images/Logo.png"),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Container(
                      width: 328,
                      height: 472,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(117, 40, 116, 0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 75, 286, 0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        controller: TextEditingController(),
                        type: TextInputType.emailAddress,
                        label: 'Enter your email address',
                      ),
                      CustomTextFormField(
                        controller: TextEditingController(),
                        type: TextInputType.visiblePassword,
                        label: 'Enter your password',
                        isPassword: true,
                      ),
                      CustomMaterialButton(
                        onPressed: () {},
                        text: 'Login',
                        color: ColorsManager.primary,
                      ),
                      CustomTextButton(
                        onPressed: () {},
                        text: 'Forgot Password?',
                      ),
                      const Text(
                        "Or Continue with",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.grayFont,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 20, 160, 0),
                            child: CustomIconButton(
                              onPressed: () {},
                              icon: "assets/icons/facebook.svg",
                              iconSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 20, 0, 0),
                            child: CustomIconButton(
                              onPressed: () {},
                              icon: "assets/icons/google.svg",
                              iconSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
