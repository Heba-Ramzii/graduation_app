import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/app_bar_section.dart';


class DoctorClinic extends StatelessWidget {
  const DoctorClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(),
      body: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
