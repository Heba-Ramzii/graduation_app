import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import 'info_body.dart';
class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius:StyleManager.borderRadius,
      ),
      child: Center(
        child: Column(
          children: [
            const ProfileImage(
              size: 90,
              height: 100,
              width: 100,
            ),
            CustomTextButton(
              text: "Change Photo",
              onPressed:(){},
              fontWeight: FontWeight.bold,
            ),
            InfoBody(),
          ],
        ),
      ),
    );
  }
}
