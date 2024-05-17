import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme_manager/colors_manager.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.iconColor = ColorsManager.primary,
      this.iconSize = 24,
      this.text = '',
      required this.onPressed,
      required this.icon});
  final String icon;
  final Color iconColor;
  final double iconSize;
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPressed,
          child: SvgPicture.asset(
            icon,
            height: iconSize,
            width: iconSize,
          ),
        ),
        Text(
          text,
        )
      ],
    );
  }
}
