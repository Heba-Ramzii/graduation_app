import 'package:flutter/material.dart';
import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

 class CustomTextButton extends StatelessWidget {
    CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  String text;
  Function()? onPressed;
    @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:  Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: StyleManager.buttonTextStyle16.copyWith(
          color: ColorsManager.primary,
        )

      ),
    );
  }
}
