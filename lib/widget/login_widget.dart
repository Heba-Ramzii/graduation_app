import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_icon_button.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        decoration: ShapeDecoration(
          color: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
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
              onPressed: () => {},
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                text: "Forget Password?",
                onPressed: () => {},
              ),
            ),
            const SizedBox(height: 30),
            const Text("Or connect with"),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: "assets/icons/facebook.svg",
                  text: "Facebook",
                ),
                CustomIconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: "assets/icons/google.svg",
                  text: "Google",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                CustomTextButton(
                  text: "  Sign up",
                  onPressed: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
