import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        //indicatorColor: ColorsManager.white,
        onDestinationSelected: (index) {},
        destinations: [
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: ColorsManager.primary,
              ),
              label: ''),
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/chat-alt.svg',
                color: ColorsManager.primary,
              ),
              label: ''),
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                color: ColorsManager.primary,
              ),
              label: ''),
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/dots-horizontal.svg',
                color: ColorsManager.primary,
              ),
              label: ''),
        ],
      ),

    );
  }
}
