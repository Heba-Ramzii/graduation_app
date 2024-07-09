import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/doctor_clinics/clinic.dart';
import 'package:graduation_app/feature/doctor/pages/home/home_screen.dart';
import 'package:graduation_app/feature/doctor/pages/more/more_screen.dart';

import '../../../patient/layout/chat_screen.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  _DoctorViewState createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeDoctorScreen(),
    const ChatScreen(),
    const Clinics(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 70,
            indicatorShape: const CircleBorder(
              eccentricity: 0.2,
            ),
            backgroundColor: ColorsManager.blue2,
            selectedIndex: currentIndex,
            indicatorColor: ColorsManager.white,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  IconlyLight.home,
                  color: ColorsManager.blue,
                  size: 24,
                ),
                selectedIcon: Icon(
                  IconlyBold.home,
                  color: ColorsManager.primary,
                  size: 24,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  IconlyLight.chat,
                  color: ColorsManager.blue,
                ),
                selectedIcon: Icon(
                  IconlyBold.chat,
                  color: ColorsManager.primary,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.add_business_outlined,
                  color: ColorsManager.blue,
                  size: 24,
                ),
                selectedIcon: Icon(
                  Icons.add_business_rounded,
                  color: ColorsManager.primary,
                  size: 24,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.more_horiz,
                  color: ColorsManager.blue,
                  size: 24,
                ),
                selectedIcon: Icon(
                  Icons.more_horiz_rounded,
                  color: ColorsManager.primary,
                  size: 24,
                ),
                label: '',
              ),
            ]),
        body: screens[currentIndex],
      ),
    );
  }
}
