import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

  
class CustomMaterialButton extends StatelessWidget {
    const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
      this.color=ColorsManager.primary,
      this.minWidth = double.infinity,
  });
  final String text;
  final  Color? color;
  final Function()? onPressed;
  final double minWidth;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(8.0))),
      color:color ,
      textColor: ColorsManager.font,
      onPressed:onPressed,
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text,
          style: StyleManager.buttonTextStyle16
        ),
      ),
    );
  }
}
