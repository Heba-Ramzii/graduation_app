import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/app_bar_section.dart';
import '../../widgets/doctor_clinics/pay_to_clinic.dart';


class DoctorClinic extends StatelessWidget {
  const DoctorClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.0),
        child: PayToClinic(),
      ),
    );
  }
}
