import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import '../widget/chat_box_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      /// backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            SizedBox(height: screenHeight * 0.02),
            const SearchBar(
              backgroundColor: MaterialStatePropertyAll(ColorsManager.white),
              hintText: 'My Chat',
              trailing: [Icon(Icons.search, color: ColorsManager.blue)],
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(height: screenHeight * 0.01),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(
                  height: screenWidth * 0.12, width: screenWidth * 0.12),
              message: "hi",
            ),
            SizedBox(height: screenHeight * 0.01),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(
                  height: screenWidth * 0.12, width: screenWidth * 0.12),
              message: "hi",
            ),
            SizedBox(height: screenHeight * 0.01),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(
                  height: screenWidth * 0.12, width: screenWidth * 0.12),
              message: "hi",
            ),
          ],
        ),
      ),
    );
  }
}
