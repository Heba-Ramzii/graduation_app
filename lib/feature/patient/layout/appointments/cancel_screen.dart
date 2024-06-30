import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../widget/appointments/reason_section.dart';

class CancelAppointmentScreen extends StatefulWidget {
  const CancelAppointmentScreen({super.key});

  @override
  State<CancelAppointmentScreen> createState() => _CancelAppointmentScreenState();
}

class _CancelAppointmentScreenState extends State<CancelAppointmentScreen> {
  var _val;
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
                  Column(
                    children: [
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                              'weather condition',
                              style: StyleManager.mainTextStyle15.copyWith(
                                  color: ColorsManager.primaryLight
                              )
                          ),
                          selectedTileColor:ColorsManager.primary ,
                          value: "weather condition",
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value;
                            });
                          }),
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title:  Text('Rescheduling',
                              style: StyleManager.mainTextStyle15.copyWith(
                                  color: ColorsManager.primaryLight
                              )),
                          value: "Rescheduling",
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value;
                            });
                          }),
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                              'Unexpected Work',style: StyleManager.mainTextStyle15.copyWith(
                              color: ColorsManager.primaryLight
                          )),
                          value: "Unexpected",
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value;
                            });
                          }),
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Other',
                              style: StyleManager.mainTextStyle15.copyWith(
                                  color: ColorsManager.primaryLight
                              )),
                          value: "Other",
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value;
                            });
                          }),
                    ],
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
