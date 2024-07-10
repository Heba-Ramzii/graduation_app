import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/patient_info_section.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/patient_note_section.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/xray_image.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({
    super.key,
    required this.patientBookModel,
    required this.index,
  });

  final PatientBookModel patientBookModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Patient'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatientInfoSection(
              index: index,
              patientBookModel: patientBookModel,
            ),
            PatientNote(problem: patientBookModel.description ?? ''),
            Center(
                child: XrayImage(
              patientId: patientBookModel.patientId!,
              patientBookModelId: patientBookModel.id!,
            )),
          ],
        ),
      ),
    );
  }
}
