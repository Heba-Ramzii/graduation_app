import 'package:flutter/cupertino.dart';
import 'package:graduation_app/feature/patient/widget/appointments/cancelled_appointment.dart';
import 'package:graduation_app/feature/patient/widget/appointments/completed_appointment.dart';
import 'package:graduation_app/feature/patient/widget/appointments/upcoming_appointment.dart';

class AllAppointments extends StatelessWidget {
  const AllAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UpcomingAppointment(),
        CancelledAppointment(),
        CompletedAppointment(),
      ],
    );
  }
}
