import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

Widget CustomTextFormField({
  Color? colorFont = ColorsManager.primaryLight2,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  final Function(String)? onChange,
  GestureTapCallback? onTap,
  bool isClickable = true,
  bool isPassword = false,
  Function()? suffixPressed,
  IconData? prefixIcon,
  double iconSize = 24,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        //style: StyleManager.textStyle14,
        controller: controller,
        keyboardType: type,

        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        onChanged: onChange,
        //enabled: isClickable,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: iconSize,
            //color: ColorsManager.grayFont,
          ),
          hintStyle: StyleManager.buttonTextStyle16.copyWith(
            color: colorFont,
          ),
          fillColor: ColorsManager.secondary,
          filled: false,

          // label: Text(
          //   label,
          //   style: TextStyle(
          //     color: ColorsManager.primary,
          //   ),
          // ),
        ),
      ),
    );
