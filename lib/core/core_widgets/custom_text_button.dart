import 'package:flutter/material.dart';
import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

 class CustomTextButton extends StatelessWidget {
    CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
      this.fontWeight,
      this.fontSize,
      this.fontColor = ColorsManager.primary,
  });
  String text;
  Function()? onPressed;
    FontWeight? fontWeight;
    double? fontSize;
    final Color fontColor;
    @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:  Text(
        text,
        textAlign: TextAlign.center,
        style: StyleManager.textStyle14.copyWith(
          color: fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        )

      ),
    );
  }
}
