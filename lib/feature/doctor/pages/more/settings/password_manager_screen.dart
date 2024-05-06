import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';
class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final reEnterPasswordController = TextEditingController();

    return  Scaffold(
      appBar: const CustomAppBar(title: "Password manager"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            EditInfoRow(
                title: "Password",
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
              icon: IconlyLight.show,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:CustomTextButton(
                text: "Forget Password?",
                onPressed: (){},
              ),
            ),
            EditInfoRow(
                title: "New Password",
                controller: newPasswordController,
                inputType: TextInputType.visiblePassword,
              icon: IconlyLight.show,
            ),
            EditInfoRow(
                title: "Re Enter Password",
                controller: reEnterPasswordController,
                inputType: TextInputType.visiblePassword,
              icon: IconlyLight.show,
            ),
            const SizedBox(height: 30,),
            CustomMaterialButton(
                text: "Set New Password",
                onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
