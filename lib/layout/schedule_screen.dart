import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/clinic_card.dart';

class SchedualScreen extends StatefulWidget {
  const SchedualScreen({Key? key});

  @override
  State<SchedualScreen> createState() => _SchedualScreenState();
}

class _SchedualScreenState extends State<SchedualScreen> {
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
            Image.asset('assets/images/Logo.png', height: 200),
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
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomMaterialButton(
                text: "Continue",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
