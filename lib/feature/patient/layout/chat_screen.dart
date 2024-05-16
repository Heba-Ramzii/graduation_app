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
    // Get the screen width and height

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SearchBar(
              backgroundColor: MaterialStatePropertyAll(ColorsManager.white),
              hintText: 'My Chat',
              trailing: [Icon(Icons.search, color: ColorsManager.blue)],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.12),
              message: "hi",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(
                  height: MediaQuery.of(context).size.width * 0.12,
                  width: MediaQuery.of(context).size.width * 0.12),
              message: "hi",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ChatBox(
              drName: Text(
                'Dr Ahmed',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.font,
                ),
              ),
              profileImage: ProfileImage(
                  height: MediaQuery.of(context).size.width * 0.12,
                  width: MediaQuery.of(context).size.width * 0.12),
              message: "hi",
            ),
          ],
        ),
      ),
    );
  }
}
