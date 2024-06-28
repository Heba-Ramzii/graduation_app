import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/patient/widget/appointments/reason_section.dart';

import '../../../../core/theme_manager/colors_manager.dart';
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
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  CustomRadioButton(
                    horizontal:true,
                    height: 45,
                    elevation: 0,
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: const [
                      '5 Stars',
                      '4 Stars',
                      '3 Stars',
                      '2 Stars',
                      '1 Stars',
                    ],
                    buttonValues: const [
                      '5 Stars',
                      '4 Stars',
                      '3 Stars',
                      '2 Stars',
                      '1 Stars',
                    ],
                    shapeRadius: 10,
                    padding: 1,
                    enableShape: true,
                    buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: ColorsManager.font,
                        textStyle: StyleManager.textStyle18),
                    radioButtonValue: (value) {
                    },
                    selectedColor: ColorsManager.primary,
                  ),
                ],
              ),
            ),
            const ReasonSection(title: "You can write a comment",),
          ],
        ),
      ),
    );
  }
}
