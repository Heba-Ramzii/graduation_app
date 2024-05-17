import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/appointment/appointment_screen.dart';
import 'package:graduation_app/feature/doctor/pages/home/home_screen.dart';
import 'package:graduation_app/feature/doctor/pages/more/more_screen.dart';

import '../../../patient/layout/chat_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeDoctorScreen(),
    const ChatScreen(),
    const AppointmentScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 70,
            indicatorShape: const CircleBorder(
              eccentricity: 0.0,
            ),
            backgroundColor: ColorsManager.blue2,
            selectedIndex: currentIndex,
            indicatorColor: ColorsManager.white,
            onDestinationSelected: (Index) {
              setState(() {
                currentIndex = Index;
              });
            },
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/chat-alt.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/dots-horizontal.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
            ]),
        body: screens[currentIndex],
      ),
    );
  }
}