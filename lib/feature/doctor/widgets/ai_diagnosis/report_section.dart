import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class ReportSection extends StatelessWidget {
  const ReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Type your report",
            style: StyleManager.mainTextStyle15.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          cursorColor: ColorsManager.primary,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)
            ),
            filled: true,
            fillColor: ColorsManager.primaryLight2,
            hintText: "Report...",
            hintStyle: StyleManager.textStyle12.copyWith(
              color: ColorsManager.primaryLight,
            ),
            prefixIcon: const Icon(
              IconlyBold.infoCircle,
              color: ColorsManager.primary,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 24,),
        CustomMaterialButton(
            text: "Confirm",
            onPressed:  (){}
        ),
      ],
    );
  }
}
