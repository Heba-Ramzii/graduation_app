import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/chat_box_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///   backgroundColor: ColorsManager.homePageBackground,
      bottomNavigationBar: NavigationBar(
        height: 70,
        indicatorShape: CircleBorder(
          eccentricity: 0.0,
        ),
        backgroundColor: ColorsManager.blue2,
        selectedIndex: 0,
        indicatorColor: ColorsManager.white,
        onDestinationSelected: (index) {},
        destinations: [
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: ColorsManager.blue,
              ),
              label: ''),
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/chat-alt.svg',
                color: ColorsManager.blue,
              ),
              label: ''),
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                color: ColorsManager.blue,
              ),
              label: ''),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/dots-horizontal.svg',
              color: ColorsManager.blue,
            ),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                SearchBar(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsManager.white),
                  hintText: 'My Chat',
                  trailing: Iterable.generate(1)
                      .map((index) =>
                          Icon(Icons.search, color: ColorsManager.blue))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 10),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(height: 50, width: 50),
              message: "hi",
            ),
            const SizedBox(height: 10),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(height: 50, width: 50),
              message: "hi",
            ),
            const SizedBox(height: 10),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(height: 50, width: 50),
              message: "hi",
            ),
          ],
        ),
      ),
    );
  }
}
