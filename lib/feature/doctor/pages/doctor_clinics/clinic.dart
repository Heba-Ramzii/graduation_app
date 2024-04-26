import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/app_bar_section.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinics_item_builder.dart';

import '../../widgets/doctor_clinics/clinics/clinics_list.dart';


class Clinics extends StatelessWidget {
  const Clinics({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarSection(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: Text(
                "Clinics",
                style: StyleManager.mainTextStyle15.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const ClinicsList(),

          ],
        ),
      ),
    );
  }
}
