import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/doctor/widgets/home/ai_features_section.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/appointment_section.dart';
import 'package:graduation_app/feature/doctor/widgets/home/user_info.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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
