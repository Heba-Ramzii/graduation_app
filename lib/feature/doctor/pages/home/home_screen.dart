import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            padding: const EdgeInsets.all(12),
            decoration: StyleManager.containerDecoration,
            child:  Row(
              children: [
                const ProfileImage(
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: StyleManager.textStyle12.copyWith(
                            fontSize: 13,
                            color: ColorsManager.primaryLight
                        ),
                      ),
                      const Text(
                        'Dr. Jimmy Fallon!',
                        style:StyleManager.textStyle14mid ,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                      FontAwesomeIcons.bell
                  ),
                  color: ColorsManager.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
