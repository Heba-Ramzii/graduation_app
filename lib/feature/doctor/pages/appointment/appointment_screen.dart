import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/clinic_section.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/patient_appointment_list.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen(
      {super.key, required this.data, required this.clincData});
  final Map<String, dynamic> data;
  final Map<String, dynamic> clincData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Appointment'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClinicSection(data: data, clincData: clincData),
            PatientAppointmentList(),
          ],
        ),
      ),
    );
  }
}
