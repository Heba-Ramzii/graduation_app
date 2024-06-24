import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class ReasonSection extends StatelessWidget {
  const ReasonSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: StyleManager.textStyle14.copyWith(
              color: const Color(0xff4B5563),
              fontWeight: FontWeight.normal,
            )
          ),
        ),
        TextField(
          cursorColor: ColorsManager.primary,
          maxLines: null,
          decoration: InputDecoration(
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsManager.primaryBorder),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsManager.primaryBorder),
            ),
            filled: true,
            fillColor: ColorsManager.white,
            hintText: "The reason",
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
            text: "Submit",
            onPressed:  (){}
        ),
      ],
    );
  }
}
