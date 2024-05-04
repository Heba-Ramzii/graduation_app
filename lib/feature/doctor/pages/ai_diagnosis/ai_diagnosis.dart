import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/file_list.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/upload_image_container.dart';



class AIDiagnosisScreen extends StatelessWidget {
  const AIDiagnosisScreen({super.key});

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
      body:  const Padding(
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
