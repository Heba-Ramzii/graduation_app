import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/clinic_section.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/patient_appointment_list.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Appointment'),
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClinicSection(),
            PatientAppointmentList(),
          ],
        ),
      ),
    );
  }
}
