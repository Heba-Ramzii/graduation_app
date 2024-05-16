import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import '../layout/my_chat_screen.dart';

class ChatBox extends StatelessWidget {
  final Widget drName;
  final String message;

  final Widget profileImage;
  const ChatBox(
      {super.key,
      required this.drName,
      required this.profileImage,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: ColorsManager.white,
        child: ListTile(
          leading: profileImage,
          title: drName,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(color: ColorsManager.blue),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MyChatScreen();
                  }),
                );
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: ColorsManager.blue,
              )),
        ),
      ),
    );
  }
}
