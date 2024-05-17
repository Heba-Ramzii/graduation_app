import 'package:flutter/material.dart';
import '../../doctor/pages/appointment/appointment_screen.dart';
import '../../doctor/widgets/home/appointment_section/appointment_list_builder.dart';

class ClinicCad extends StatelessWidget {
  const ClinicCad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          child: const AppointmentListBuilder(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AppointmentScreen()),
            );
          },
        ),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
      ),
    );
  }
}
