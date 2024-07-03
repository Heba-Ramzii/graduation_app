import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/pages/doctor_clinics/add_clinic.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/app_bar_section.dart';

import '../../widgets/doctor_clinics/clinics/clinics_list.dart';

class Clinics extends StatelessWidget {
  const Clinics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Clinics',
      ),
      // appBar: const AppBarSection(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: Text(
                "Clinics",
                style: StyleManager.mainTextStyle15
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ), */
            ClinicsList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.primary,
        onPressed: () => navigateToScreen(context, AddClinic()),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
