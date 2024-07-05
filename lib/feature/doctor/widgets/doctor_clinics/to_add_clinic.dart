import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class ToAddClinic extends StatelessWidget {
  const ToAddClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
            "You don’t have any Clinics",
          style: StyleManager.textStyle13
        ),
        const SizedBox(height: 22,),
        CustomMaterialButton(
            text: "Add One",
            onPressed:  (){

            }
        ),
      ],
    );
  }
}
