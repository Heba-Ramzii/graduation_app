import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

import '../../../../core/core_widgets/custom_app_bar.dart';
import '../../widgets/doctor_clinics/clinics/add_clinic/clinic_info_container.dart';

class AddClinic extends StatelessWidget {
  const AddClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "Info",
        actionIcon: Icons.done_rounded,
        actionTap: (){},
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ClinicInfoContainer(),

          ],
        ),
      ),
    );
  }
}
