import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    this.style,
    super.key,
    required this.text,
    required this.onPressed,
    this.color = ColorsManager.primary,
    this.minWidth = double.infinity,
    this.fontColor,
    this.height= double.minPositive,
  });
  final TextStyle? style;
  final String text;
  final Color? color;
  final Color? fontColor;
  final Function()? onPressed;
  final double minWidth;
  final double height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: height,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      color: color,
      textColor: ColorsManager.font,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(text, style: style ?? StyleManager.buttonTextStyle16.copyWith(
          color: fontColor
        )),
      ),
    );
  }
}
