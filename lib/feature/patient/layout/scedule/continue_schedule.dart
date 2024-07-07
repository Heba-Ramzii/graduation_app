import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/layout/scedule/final_schedule.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DayTime {
  final String day;
  final String time;

  DayTime(this.day, this.time);

  @override
  String toString() {
    return '$day - $time';
  }
}
class ContinueScheduleScreen extends StatefulWidget {
  const ContinueScheduleScreen({
    super.key,
  });

  @override
  State<ContinueScheduleScreen> createState() => _ContinueScheduleScreenState();
}

class _ContinueScheduleScreenState extends State<ContinueScheduleScreen> {
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isSelf = true;
  bool isMale = true;

  DayTime? selectedDayTime;

  final List<DayTime> dayTimeList = [
    DayTime('Monday', '08:00 AM'),
    DayTime('Monday', '09:00 AM'),
    DayTime('Tuesday', '10:00 AM'),
    DayTime('Tuesday', '11:00 AM'),
    DayTime('Wednesday', '12:00 PM'),
    DayTime('Wednesday', '01:00 PM'),
    DayTime('Thursday', '02:00 PM'),
    DayTime('Thursday', '03:00 PM'),
    DayTime('Friday', '04:00 PM'),
    DayTime('Friday', '05:00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const SizedBox(height: 20),
            Text('Select a Day and Time:'),
            DropdownButton<DayTime>(
              hint: Text('Select Day and Time'),
              value: selectedDayTime,
              onChanged: (DayTime? newValue) {
                setState(() {
                  selectedDayTime = newValue!;
                });
              },
              items: dayTimeList.map<DropdownMenuItem<DayTime>>((DayTime value) {
                return DropdownMenuItem<DayTime>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
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
              initialLabelIndex: isSelf ? 0 : 1,
              totalSwitches: 2,
              borderWidth: 1,
              borderColor: const [
                ColorsManager.grayFont,
                ColorsManager.primary,
              ],
              inactiveBgColor: ColorsManager.white ,
              inactiveFgColor: ColorsManager.grayFont ,
              labels: const ['Your Self', 'Another Person'],
              onToggle: (index) {
                print('switched to: $index');
                setState(() {
                  isSelf = !isSelf;
                });
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
              controller: patientNameController,
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
              controller: ageController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ToggleSwitch(
                minWidth: MediaQuery.of(context).size.width,
                initialLabelIndex: isMale ? 0 : 1,
                totalSwitches: 2,
                borderWidth: 1,
                borderColor: const [
                  ColorsManager.grayFont,
                  ColorsManager.primary,
                ],
                inactiveBgColor: ColorsManager.white ,
                inactiveFgColor: ColorsManager.grayFont ,
                labels: const ['Male', 'Female'],
                onToggle: (index) {
                  print('switched to: $index');
                  setState(() {
                    isMale = !isMale;
                  });
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
                controller: descriptionController,
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
              text: "Continue",
              onPressed: () {
                navigateToScreen(context, const FinalScheduleScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
