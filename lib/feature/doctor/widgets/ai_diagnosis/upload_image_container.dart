import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/generated/assets.dart';

class UploadImageContainer extends StatelessWidget {
  const UploadImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
        side: BorderSide(
        width: 2,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: ColorsManager.primaryBorder,
    ),
    ),
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              Assets.imagesUploadCloud,
            height: 100,
            width: 100,
          ),
          Text(
              "Drag or drop file here",
            style: StyleManager.buttonTextStyle16.copyWith(
              color: ColorsManager.primaryLight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21.0),
            child: Text(
                "-OR-",
              style: StyleManager.buttonTextStyle16.copyWith(
                color: ColorsManager.primaryLight,
              ),
            ),
          ),
          CustomMaterialButton(
              text: "Choose File",
              onPressed:  (){}
          ),
        ],
      ),
    );
  }
}
