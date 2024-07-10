import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/data/models/ai_model.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/image_result_section.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/report_section.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';

class AIDiagnosisDetectedScreen extends StatelessWidget {
  const AIDiagnosisDetectedScreen(
      {super.key,this.model, this.image});
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
              // ReportSection(
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class AIDiagnosisDetectedDoctorScreen extends StatelessWidget {
  const AIDiagnosisDetectedDoctorScreen(
      {super.key, required this.patientId, required this.patientBookModel ,this.model, this.image});
  final AIModel? model;
  final File? image;

  final String patientId;
  final PatientBookModel patientBookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'AI Diagnosis'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ImageResultSection(
                model: model,
                image: image!,
              ),
              //const ImageResultDoctorSection(),
              ReportDoctorSection(
                model: model,
                patientId: patientId,
                  patientBookModel: patientBookModel
              ),
            ],
          ),
        ),
      ),
    );
  }
}
