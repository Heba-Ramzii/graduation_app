import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/ai_diagnosis.dart';

import '../../../../generated/assets.dart';

class XrayImage extends StatelessWidget {
  const XrayImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            Assets.imagesXray1,
            fit: BoxFit.contain,
          ),
        ),
        InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AiDiagnosisScreen()));
        },
        child: const CircleAvatar(
          backgroundColor: ColorsManager.secondary,
          child: Icon(
              IconlyBold.scan,
            color: ColorsManager.primary,
            size: 24,
          ),
        ),
                  )
      ],
    );
  }
}
