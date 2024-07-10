import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

import '../../../../generated/assets.dart';
import '../../pages/ai_diagnosis/ai-diagnosis_detected.dart';

class XrayImage extends StatelessWidget {
  const XrayImage(
      {super.key, required this.patientId, required this.patientBookModelId});

  final String patientId;
  final String patientBookModelId;

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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AIDiagnosisDetectedScreen(
                          patientId: patientId,
                          patientBookModelId: patientBookModelId,
                        )));
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
