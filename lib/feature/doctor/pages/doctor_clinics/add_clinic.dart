import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/add_clinic/appointment_container.dart';

import '../../../../core/core_widgets/custom_app_bar.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../widgets/doctor_clinics/clinics/add_clinic/clinic_info_container.dart';

class AddClinic extends StatelessWidget {
  const AddClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "Add Clinic",
        actionIcon: Icons.done_rounded,
        actionTap: (){},
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClinicInfoContainer(),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Appointments",
                  style: StyleManager.mainTextStyle15.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppointmentContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
