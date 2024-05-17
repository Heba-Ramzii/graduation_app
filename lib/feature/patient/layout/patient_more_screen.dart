import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/doctor/widgets/more/options_column.dart';
import 'package:graduation_app/feature/patient/widget/more/patient_options_column.dart';

import '../../../../core/theme_manager/style_manager.dart';

class PatientMoreScreen extends StatelessWidget {
  const PatientMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            const ProfileImage(
              height: 100,
              width: 100,
              size: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Text(
                "Jimmy Fallon",
                style: StyleManager.textStyle14
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            const PatientOptionsColumn(),
          ],
        ),
      ),
    );
  }
}
