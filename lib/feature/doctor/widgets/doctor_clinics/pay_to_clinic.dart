import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';

import '../../../../core/theme_manager/style_manager.dart';

class PayToClinic extends StatelessWidget {
  const PayToClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
            "Your account is now disabled,\n"
                "You did not pay the monthly subscription",
            style: StyleManager.textStyle13,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22,),
         CustomMaterialButton(
            text: "Pay",
            onPressed:  (){}
        ),
      ],
    );
  }
}
