import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/models/ai_model.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../../../generated/assets.dart';

class ImageResultSection extends StatelessWidget {
  const ImageResultSection({super.key, this.model, required this.image});
  final AIModel? model;
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
          model!.result!,
          style: StyleManager.mainTextStyle15.copyWith(
            fontWeight: FontWeight.bold,
            color: model!.resultClass == 1
                ? ColorsManager.red
                : ColorsManager.primary,
          ),
        ),
      ],
    );
  }
}
