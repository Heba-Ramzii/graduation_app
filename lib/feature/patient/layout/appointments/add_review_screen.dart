import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/patient/widget/appointments/reason_section.dart';

import '../../../../core/theme_manager/style_manager.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Review"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ProfileImage(height: 100, width: 100,size: 100,),
            ),
            Text("Jimmy Fallon",
                style: StyleManager.mainTextStyle15.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [],
              ),
            ),
            const ReasonSection(title: "You can write a comment",),
          ],
        ),
      ),
    );
  }
}
