import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/layout/schedule_screen_2.dart';
import 'package:graduation_app/widget/clinic_card.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SchedualScreen extends StatefulWidget {
  const SchedualScreen({Key? key});

  @override
  State<SchedualScreen> createState() => _SchedualScreenState();
}

class _SchedualScreenState extends State<SchedualScreen> {
  get controller1 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 16),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorsManager.blue,
                  ),
                ),
                Text(
                  "Schedule",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/profile.png',
            ),
            SizedBox(height: 20),
            Text(
              "Profile",
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
            ),
            SizedBox(height: 30),
            Text(
              "Choose Clinic",
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ClinicCad(
              doctorName: "Ebrahim",
              adddress: "Abokpir",
              time: "12:1",
            ),
            SizedBox(height: 15),
            Text(
              "Choose Time",
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
            SizedBox(height: 50),
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
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomMaterialButton(
                text: "Submit",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ScheduleSreen2();
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
