import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/image_result_section.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/report_section.dart';


class AIDiagnosisDetectedScreen extends StatelessWidget {
  const AIDiagnosisDetectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'AI Diagnosis'),
      body: SingleChildScrollView(
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
