import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/patient/widget/scedule/info_column.dart';
import 'package:graduation_app/feature/patient/widget/scedule/time_column.dart';

import '../../../../core/function/core_function.dart';
import '../../widget/scedule/doctor_card.dart';
import '../appointments/appointments_patient_screen.dart';


class FinalScheduleScreen extends StatefulWidget {
  const FinalScheduleScreen({
    super.key,
  });

  @override
  State<FinalScheduleScreen> createState() => _FinalScheduleScreenState();
}

class _FinalScheduleScreenState extends State<FinalScheduleScreen> {
  get controller1 => null;
  void _showModalSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 200.0,
            color: Colors.green,
            child: new Center(
              child: new Text(" Modal BottomSheet",textScaleFactor: 2,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
          );
        }
    );
  }

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
            const DoctorCard (),
            const TimeColumn(),
            const InfoColumn(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomMaterialButton(
                text: "Submit",
                onPressed: () {
                  showMyDialog(context, "Congratulations", "you have Booked successfully", () {
                    navigateToScreen(context,  AppointmentsPatientScreen());
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
