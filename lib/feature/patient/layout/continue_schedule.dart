import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/layout/patient_home_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widget/clinic_card.dart';

class ContinueScheduleScreen extends StatefulWidget {
  const ContinueScheduleScreen({
    super.key,
  });

  @override
  State<ContinueScheduleScreen> createState() => _ContinueScheduleScreenState();
}

class _ContinueScheduleScreenState extends State<ContinueScheduleScreen> {
  get controller1 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: ColorsManager.blue,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Patient Information",
                style: StyleManager.textStyle18.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: const ['Your Self', 'Another Person'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            const SizedBox(height: 15),
            Text(
              "Patient name",
              style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.primary
              ),
            ),
            TextField(
              cursorColor: ColorsManager.primary,
              controller: controller1,
            ),
            const SizedBox(height: 10),
            Text(
              "Age",
              style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.primary
              ),
            ),
            TextField(
              cursorColor: ColorsManager.primary,
              controller: controller1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ToggleSwitch(
                minWidth: MediaQuery.of(context).size.width,
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: const ['Male', 'Female'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
            Text(
              "Describe Your Case",
              style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.font
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                cursorColor: ColorsManager.primary,
                maxLines: 3,
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: ColorsManager.primaryBorder),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: ColorsManager.primaryBorder),
                  ),
                  filled: true,
                  fillColor: ColorsManager.white,
                  hintText: "Enter the problem ",
                  hintStyle: StyleManager.textStyle12.copyWith(
                    color: ColorsManager.primaryLight,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            CustomMaterialButton(
              text: "Submit",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const PatientHome();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
