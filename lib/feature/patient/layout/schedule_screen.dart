import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/layout/patient_home_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widget/clinic_card.dart';

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
            Image.asset(
              'assets/images/profile.png',
              height: 200,
              width: double.infinity,
            ),
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
              color: ColorsManager.white,
              child: DatePicker(
                minDate: DateTime(2021, 1, 1),
                maxDate: DateTime(2023, 12, 31),
                onDateSelected: (value) {
                  // Handle selected date
                },
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 10),
            const Divider(
              color: ColorsManager.blue,
              thickness: 2,
            ),
            const SizedBox(height: 5),
            const Text(
              "Patient Information",
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: const ['Your Self', 'Another Person'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            const SizedBox(height: 10),
            const Text(
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
             Text(
              "Age",
              style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.primary
              ),
            ),
            CustomTextFormField(
              controller: controller1,
              type: TextInputType.phone,
            ),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: const ['Male', 'Female'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 12.0),
               child: Text(
                "Describe Your Case",
                style: StyleManager.buttonTextStyle16.copyWith(
                    color: ColorsManager.font
                ),
                           ),
             ),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your case here',
                hintStyle: const TextStyle(
                  color: ColorsManager.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomMaterialButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
