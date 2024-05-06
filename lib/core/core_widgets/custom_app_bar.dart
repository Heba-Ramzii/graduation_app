import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            StyleManager.mainTextStyle15.copyWith(fontWeight: FontWeight.bold),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
