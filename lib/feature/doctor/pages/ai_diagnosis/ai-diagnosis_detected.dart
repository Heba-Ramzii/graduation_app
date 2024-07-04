import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/models/ai_model.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/image_result_section.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/report_section.dart';

class AIDiagnosisDetectedScreen extends StatelessWidget {
  const AIDiagnosisDetectedScreen({super.key, this.model, this.image});
  final AIModel? model;
  final File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'AI Diagnosis'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ImageResultSection(
                model: model,
                image: image!,
              ),
              const ReportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
