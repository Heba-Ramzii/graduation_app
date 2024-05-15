import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ScheduleSreen2 extends StatefulWidget {
  const ScheduleSreen2({super.key});

  @override
  State<ScheduleSreen2> createState() => _ScheduleSreen2State();
}

class _ScheduleSreen2State extends State<ScheduleSreen2> {
  late TextEditingController controller1;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: ColorsManager.blue,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Schedule",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
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
            const SizedBox(height: 10),
            const Text(
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
            const SizedBox(height: 10),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: const ['Male', 'Female'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            const SizedBox(height: 10),
            const Text(
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
                hintStyle: const TextStyle(
                  color: ColorsManager.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
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
