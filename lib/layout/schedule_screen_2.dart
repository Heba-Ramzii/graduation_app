import 'dart:ffi';

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ScheduleSreen2 extends StatefulWidget {
  const ScheduleSreen2({super.key});

  @override
  State<ScheduleSreen2> createState() => _ScheduleSreen2State();
}

class _ScheduleSreen2State extends State<ScheduleSreen2> {
  @override
  TextEditingController controller1 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 16),
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorsManager.blue,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "schedule",
                  style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              color: ColorsManager.white,
              child: DatePicker(
                minDate: DateTime(2021, 1, 1),
                maxDate: DateTime(2023, 12, 31),
                onDateSelected: (value) {
                  // Handle selected date
                },
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: ColorsManager.blue,
              thickness: 2,
            ),
            SizedBox(height: 5),
            Text(
              "Patient Information",
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: ['Your Self', 'Another Person'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            SizedBox(height: 10),
            Text(
              "Full Name",
              style: TextStyle(
                color: ColorsManager.primary,
                fontSize: 16,
              ),
            ),
            CustomTextFormField(
              controller: controller1,
              type: TextInputType.name,
            ),
            SizedBox(height: 10),
            Text(
              "Age",
              style: TextStyle(
                color: ColorsManager.primary,
                fontSize: 16,
              ),
            ),
            CustomTextFormField(
              controller: controller1,
              type: TextInputType.phone,
            ),
            SizedBox(height: 10),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: ['Male', 'Female'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            SizedBox(height: 10),
            Text(
              "Describe Your Case",
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: 18,
              ),
            ),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your case here',
                hintStyle: TextStyle(
                  color: ColorsManager.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: CustomMaterialButton(text: "Continue", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
