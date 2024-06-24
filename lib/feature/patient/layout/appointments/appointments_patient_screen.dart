import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/filter_row.dart';
import 'package:graduation_app/feature/patient/widget/appointments/upcoming_appointment.dart';

import '../../../../core/core_widgets/custom_app_bar.dart';
import '../../widget/appointments/cancelled_appointment.dart';
import '../../widget/appointments/completed_appointment.dart';


class AppointmentsPatientScreen extends StatefulWidget {
   AppointmentsPatientScreen({super.key});

  @override
  State<AppointmentsPatientScreen> createState() => _AppointmentsPatientScreenState();
}

class _AppointmentsPatientScreenState extends State<AppointmentsPatientScreen> {
  int _selectedIndex = 0;

  final List<String> filter = [
     'All',
     'Upcoming',
     'Completed',
     'Cancelled',
   ];

   final List<Widget> screens = [
      AppointmentsPatientScreen(),
     const UpcomingAppointment(),
     const CompletedAppointment(),
     const CancelledAppointment(),
   ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Appointments",
        actionIcon:IconlyLight.filter,
        //actionTap: (),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterRow(
              filters: filter,
              onSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => const CompletedAppointment(),
                itemCount: 10,
              ),
            )
        ],
        ),
      ),
    );
  }
}
