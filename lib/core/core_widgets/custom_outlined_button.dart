import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isIcon = false,
    this.isSvg = false,
    this.iconColor = ColorsManager.white,
    this.fontColor = ColorsManager.white,
    this.iconSvg,
    this.color = ColorsManager.primary,
  });
  final String text;
  final IconData? icon;
  final String? iconSvg;
  final Color iconColor;
  final Color color;
  final Color fontColor;
  final bool isIcon;
  final bool isSvg;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(0),
        side: MaterialStateProperty.all(
             BorderSide(color: color)),
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
                  style: StyleManager.buttonTextStyle16.copyWith(
                    color: fontColor
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                !isSvg ? Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ) : SvgPicture.asset(
                      iconSvg!,
                  width: 24,
                  height: 24,
                 ) ,
              ],
            ),
          if (!isIcon)
            Text(
              text,
              style: StyleManager.buttonTextStyle16
                  .copyWith(
                  fontWeight: FontWeight.normal,
              ),
            ),
        ],
      ),
    );
  }
}
