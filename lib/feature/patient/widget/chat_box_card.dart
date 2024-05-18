import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

import '../../../core/core_widgets/profile_image.dart';

class ChatBox extends StatelessWidget {
  final String drName;
  final String message;
  final bool haveMessage;

  const ChatBox(
      {super.key,
      required this.drName,
      required this.message, 
        required this.haveMessage,
        
      });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: StyleManager.containerDecoration,
        child: ListTile(
          leading: ProfileImage(
            height: screenWidth * 0.12, width: screenWidth * 0.12,size: screenWidth * 0.12,
          ),
          title: Text(
              drName,
            style: StyleManager.mainTextStyle15.copyWith(
              fontWeight: FontWeight.w500
            )
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(color: ColorsManager.blue),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "09:25 PM",
                style: StyleManager.textStyle13.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              haveMessage ? CircleAvatar(
                radius: 15,
                backgroundColor: ColorsManager.primaryLight3,
                child: Text(
                    "2",
                  style: StyleManager.buttonTextStyle16.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
                  :
              const Icon(
                Icons.done_all_rounded,
                color: ColorsManager.grayFont,

              )
            ],
          ),
        ),
      ),
    );
  }
}
