import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      title: Row(
        children: [
          const ProfileImage(
            height: 60,
            width: 60,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr. Jimmy Fallon!',
                  style:StyleManager.textStyle14mid ,
                ),
                Text(
                  'Specialty',
                  style: StyleManager.textStyle12.copyWith(
                      fontSize: 13,
                      color: ColorsManager.primaryLight
                  ),
                ),

              ],
            ),
          ),
        ],
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
      actions: const [
        InkWell(
          child: Icon(
            Icons.edit,
            size: 20,
            color: ColorsManager.primary,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

 }
