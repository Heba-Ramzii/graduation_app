import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/navigation_bar.dart';
import 'package:graduation_app/feature/doctor/pages/appointment/appointment_screen.dart';
import 'package:graduation_app/feature/doctor/pages/more/profile/doctor_profile.dart';
import 'package:graduation_app/feature/doctor/widgets/home/ai_features_section.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/appointment_section.dart';
import 'package:graduation_app/feature/doctor/widgets/home/user_info.dart';
import '../../../patient/layout/chat_screen.dart';


class HomeDoctorScreen extends StatefulWidget {
  const HomeDoctorScreen({super.key});


  @override
  State<HomeDoctorScreen> createState() => _HomeDoctorScreenState();
}

class _HomeDoctorScreenState extends State<HomeDoctorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          UserInfoSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppointmentSection(),
                AIFeaturesSection(),
               ],
            ),
          ),
         ],
      ),

    );
  }
}
