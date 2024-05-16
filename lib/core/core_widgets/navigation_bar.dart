import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';


class BottomNavBarMenue extends StatefulWidget {
  BottomNavBarMenue({super.key, 
    required this.currentIndex,
  });

  int currentIndex = 0;

  @override
  State<BottomNavBarMenue> createState() => _BottomNavBarMenueState();
}

class _BottomNavBarMenueState extends State<BottomNavBarMenue> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        height: 70,
        indicatorShape: const CircleBorder(
          eccentricity: 0.0,
        ),
        backgroundColor: ColorsManager.blue2,
        selectedIndex: widget.currentIndex,
        indicatorColor: ColorsManager.white,
        onDestinationSelected: (Index) {
          setState(() {
            widget.currentIndex = Index;
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
        ]);
  }
}
