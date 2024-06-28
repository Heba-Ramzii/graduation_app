import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../widget/appointments/reason_section.dart';

class CancelAppointmentScreen extends StatelessWidget {
  const CancelAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: "Cancel Appointment"),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Why you want to cancel the appointment?",
              style: StyleManager.mainTextStyle15.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child:Column(
                children: [
                  CustomRadioButton(
                    horizontal:true,
                    height: 45,
                    elevation: 0,
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: const [
                      'weather condition',
                      'Rescheduling',
                      'Unexpected Work',
                      'Other',
                    ],
                    buttonValues: const [
                      "weather",
                      "Rescheduling",
                      "Unexpected",
                      "Other",
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
            const ReasonSection(title: "Tell Us The reason",),
          ],
        ),
      ),
    );
  }
}
