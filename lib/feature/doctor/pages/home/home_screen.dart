import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/feature/doctor/widgets/home/ai_features_section.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/appointment_section.dart';
import 'package:graduation_app/feature/doctor/widgets/home/user_info.dart';

import '../../../../core/theme_manager/colors_manager.dart';


class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({super.key});

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
      bottomNavigationBar: NavigationBar(
        height: 70,
        indicatorShape: const CircleBorder(
          eccentricity: 0.0,
        ),
        backgroundColor: ColorsManager.primaryLight2,
        selectedIndex: 0,
        indicatorColor: ColorsManager.white,
        onDestinationSelected: (index) {},
        destinations: const [
          NavigationDestination(
              icon: Icon(
                  Icons.home_outlined,
                color: ColorsManager.primaryLight4,
                size: 20,
              ),
              label: ''),
          NavigationDestination(
              icon:  Icon(
                  Icons.chat_outlined,
                color: ColorsManager.primaryLight4,
                size: 20,
              ),
              label: ''),
          NavigationDestination(
              icon:  Icon(
                  IconlyLight.calendar,
                color: ColorsManager.primaryLight4,
                size: 20,
              ),
              label: ''),
          NavigationDestination(
              icon:  Icon(
                  Icons.more_horiz_rounded,
                color: ColorsManager.primaryLight4,
                size: 20,
              ),
              label: ''),
        ],
      ),

    );
  }
}
