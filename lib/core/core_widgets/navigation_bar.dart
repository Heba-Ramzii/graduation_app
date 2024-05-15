import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/layout/chat_screen.dart';
import 'package:graduation_app/layout/patient_home_screen.dart';
import 'package:graduation_app/layout/schedule_screen.dart';

class NavigationBarMenue extends StatefulWidget {
  const NavigationBarMenue({super.key});

  @override
  State<NavigationBarMenue> createState() => _NavigationBarMenueState();
}

class _NavigationBarMenueState extends State<NavigationBarMenue> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 70,
          indicatorShape: CircleBorder(
            eccentricity: 0.0,
          ),
          backgroundColor: ColorsManager.blue2,
          selectedIndex: currentIndex,
          indicatorColor: ColorsManager.white,
          onDestinationSelected: (currentIndex) {
            if (currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return PatientHome();
                }),
              );
            } else if (currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return ChatScreen();
                }),
              );
            } else if (currentIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return SchedualScreen();
                }),
              );
            }
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
    );
  }
}
