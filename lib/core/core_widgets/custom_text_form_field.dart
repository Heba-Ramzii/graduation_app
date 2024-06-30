import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

Widget CustomTextFormField({
  Color? colorFont = ColorsManager.primaryLight2,
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onSubmit,
  final Function(String)? onChange,
  GestureTapCallback? onTap,
  bool isClickable = true,
  bool isPassword = true,
  void Function()? suffixPressed,
  IconData? prefixIcon,
  double iconSize = 24,
  String label = "",
  String hint = "",
  IconData? suffixIcon,
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
        validator: (String? value) {
          if (value!.isEmpty) {
            return "required";
          }
          return null;
        },
        onChanged: onChange,
        scrollPadding: const EdgeInsets.all(0.0),
        //enabled: isClickable,
        decoration: InputDecoration(
          suffixIcon: suffixPressed != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon:  Icon(
                    suffixIcon,
                    color: ColorsManager.primary,
                  ),
                )
              : null,
          fillColor: ColorsManager.secondary,
          filled: false,
          label: Text(
            label,
            style:
                StyleManager.textStyle13.copyWith(color: ColorsManager.primary),
          ),
          hintText: hint,
          hintStyle: StyleManager.textStyle14,
        ),
      ),
    );