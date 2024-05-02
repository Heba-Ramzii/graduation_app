import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/patient_info_section.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/patient_note_section.dart';
import 'package:graduation_app/feature/doctor/widgets/patient_details/xray_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Patient',
          style: StyleManager.mainTextStyle15.copyWith(
              fontWeight: FontWeight.bold
          ),
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
      body:const Padding(
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
