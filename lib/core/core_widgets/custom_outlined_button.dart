import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

class CustomOutlineButton extends StatelessWidget {
    const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
      this.icon, 
      this.isIcon=false,
      this.iconColor=ColorsManager.grayFont,
  });
  final String text;
  final IconData? icon;
  final Color iconColor;
  final bool isIcon ;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(color: ColorsManager.primary)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isIcon)
              Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: iconColor,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    text.toUpperCase(),
                    style: StyleManager.buttonTextStyle16.copyWith(
                        fontWeight: FontWeight.normal
                    ),
                  ),

                ],
              ),if (!isIcon)
                    Text(
                text.toUpperCase(),
                style: StyleManager.buttonTextStyle16.copyWith(
                    fontWeight: FontWeight.normal
                ),
               ),
          ],
        ),
      ),
    );
  }
}
