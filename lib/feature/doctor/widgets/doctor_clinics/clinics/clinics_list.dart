import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinics_item_builder.dart';

class ClinicsList extends StatelessWidget {
  const ClinicsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => const ClinicsItemBuilder(),
        itemCount: 3,
      ),
    );
  }
}
