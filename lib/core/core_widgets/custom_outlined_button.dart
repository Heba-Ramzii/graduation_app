import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isIcon = false,
    this.iconColor = ColorsManager.white,
  });
  final String text;
  final IconData? icon;
  final Color iconColor;
  final bool isIcon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.primary),
        elevation: MaterialStateProperty.all(0),
        side: MaterialStateProperty.all(
            const BorderSide(color: ColorsManager.primary)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isIcon)
            Row(
              children: [
                Text(
                  text,
                  style: StyleManager.buttonTextStyle16.copyWith(),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ],
            ),
          if (!isIcon)
            Text(
              text,
              style: StyleManager.buttonTextStyle16
                  .copyWith(fontWeight: FontWeight.normal),
            ),
        ],
      ),
    );
  }
}
