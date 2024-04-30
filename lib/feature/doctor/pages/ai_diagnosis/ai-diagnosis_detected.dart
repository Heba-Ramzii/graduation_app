import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/image_result_section.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/report_section.dart';


class AIDiagnosisDetectedScreen extends StatelessWidget {
  const AIDiagnosisDetectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Diagnosis',
          style: StyleManager.mainTextStyle15
              .copyWith(fontWeight: FontWeight.bold),
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
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ImageResultSection(),
              ReportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
