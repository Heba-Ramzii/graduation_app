import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
        indicatorShape:  const CircleBorder(
          eccentricity: 0.2,
        ),
        backgroundColor: ColorsManager.blue2,
        selectedIndex: widget.currentIndex,
        indicatorColor: ColorsManager.white,
        onDestinationSelected: (Index) {
          setState(() {
            widget.currentIndex = Index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              IconlyLight.home,
              color: ColorsManager.blue,
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              IconlyLight.chat,
              color: ColorsManager.blue,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              IconlyLight.calendar,
              color: ColorsManager.blue,
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.more_horiz_rounded,
              color: ColorsManager.blue,
              size: 24,
            ),
            label: '',
          ),
        ]);
  }
}
