import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/file_list.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/upload_image_container.dart';



class AIDiagnosisScreen extends StatelessWidget {
  const AIDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'AI Diagnosis'),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             UploadImageContainer(),
             FileList(),
             ],
        ),
      ),
    );
  }
}
