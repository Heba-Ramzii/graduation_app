import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/layout/my_chat_screen.dart';

import '../widget/chat_box_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
      List<bool> haveMessage = [
        true,
        true,
        true,
        false,
        false,
        true,
        true,
        true,
        false,
        false,

      ];

    return Scaffold(
      /// backgroundColor: ColorsManager.homePageBackground,
      appBar: AppBar(
        elevation: 2.0,
        shadowColor:ColorsManager.shadow ,
        backgroundColor: ColorsManager.white,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
         title: Text("My Chat",
          style: StyleManager.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: ColorsManager.primary,
                size: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: ColorsManager.primary,
                size: 24,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>   InkWell(
                  child:
                  ChatBox(drName: 'Dr Ahmed', message: "hi", haveMessage: haveMessage[index],),
                  onTap: (){
                    navigateToScreen(context, const MyChatScreen());
                  },
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5),
                itemCount: 5
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    "your personal messages are ",
                  style: StyleManager.textStyle13.copyWith(
                    color: ColorsManager.font,
                  ),
                ),
                Text(
                    "end-to-end-encrypted",
                  style: StyleManager.textStyle13.copyWith(
                    color: ColorsManager.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
