import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/patient_info_section.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/patient_note_section.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/xray_image.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Patient'),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatientInfoSection(),
            PatientNote(),
            Center(child: XrayImage()),
          ],
        ),
      ),
    );
  }
}
