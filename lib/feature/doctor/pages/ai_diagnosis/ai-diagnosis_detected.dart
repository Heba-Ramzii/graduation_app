import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/image_result_section.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/report_section.dart';

class AIDiagnosisDetectedScreen extends StatelessWidget {
  const AIDiagnosisDetectedScreen(
      {super.key, required this.patientId, required this.patientBookModelId});

  final String patientId;
  final String patientBookModelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'AI Diagnosis'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const ImageResultSection(),
              ReportSection(
                patientId: patientId,
                patientBookModelId: patientBookModelId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
