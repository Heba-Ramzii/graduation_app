import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.title, this.actionIcon, this.actionTap, this.actions});

  final String title;
  final IconData? actionIcon;
  final Function()? actionTap;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      title: Text(
        title,
        style:
            StyleManager.mainTextStyle15.copyWith(
              fontSize: 16,
                fontWeight: FontWeight.bold,
            ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.primaryLight3,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        },
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
