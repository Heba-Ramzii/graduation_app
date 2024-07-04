import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';


 class CustomTextButton extends StatelessWidget {
    CustomTextButton({

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color fontColor;
  final Function()? onPressed;
  FontWeight? fontWeight;
  double? fontSize;

  CustomTextButton({

    super.key,
    required this.text,
    required this.onPressed,
     this.fontColor =ColorsManager.primary,
    this.fontWeight ,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: StyleManager.buttonTextStyle16.copyWith(
          color:fontColor ,
          fontWeight: fontWeight,
          fontSize:fontSize
        ),
      ),
    );
  }
}
