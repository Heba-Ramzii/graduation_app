import 'package:flutter/material.dart';
import '../theme_manager/colors_manager.dart';

class CustomFillterButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  CustomFillterButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          ColorsManager.blue2,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        style: TextStyle(
          color: ColorsManager.blue3,
          fontSize: 16,
        ),
        text,
      ),
    );
  }
}
