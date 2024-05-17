import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';

import '../../../../core/theme_manager/style_manager.dart';

class EditToClinic extends StatelessWidget {
  const EditToClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "You don’t have access,\n"
              "please edit your information to be confirmed",
          style: StyleManager.textStyle13,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22,),
        CustomMaterialButton(
            text: "Edit",
            onPressed:  (){}
        ),
      ],
    );
  }
}
