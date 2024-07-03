import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../../../generated/assets.dart';

class ImageResultSection extends StatelessWidget {
  const ImageResultSection({super.key, required this.image});
  final File image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: image.path == ''
              ? Image.asset(
                  Assets.imagesXray1,
                  fit: BoxFit.contain,
                )
              : Image.file(
                  image,
                  fit: BoxFit.contain,
                ),
        ),
        Text(
          "Issue Detected",
          style: StyleManager.mainTextStyle15
              .copyWith(fontWeight: FontWeight.bold, color: ColorsManager.red),
        ),
      ],
    );
  }
}
