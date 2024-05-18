import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

import '../widget/clinic_card.dart';
import 'continue_schedule.dart';

class SchedualScreen extends StatefulWidget {
  const SchedualScreen({
    super.key,
  });

  @override
  State<SchedualScreen> createState() => _SchedualScreenState();
}

class _SchedualScreenState extends State<SchedualScreen> {
  get controller1 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImage(height: 200, width: double.infinity),
             Padding(
               padding: const EdgeInsets.only(top: 16.0,bottom: 6),
               child: Text(
                "Profile",
                style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.font
                ),
                           ),
             ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
            ),
            const SizedBox(height: 30),
             Text(
              "Choose Clinic",
              style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.font
              ),
            ),
            const ClinicCad(
            ),
            const SizedBox(height: 15),
             Text(
              "Choose Time",
              style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.font
              ),
            ),
            Container(
              margin:const EdgeInsets.symmetric(vertical: 20.0) ,
              decoration: StyleManager.containerDecoration,
              child: DatePicker(
                minDate: DateTime(2024, 1, 1),
                maxDate: DateTime(2050, 12, 31),
                onDateSelected: (value) {
                  // Handle selected date
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomMaterialButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const ContinueScheduleScreen();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
