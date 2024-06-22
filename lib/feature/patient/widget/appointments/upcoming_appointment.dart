import 'package:flutter/material.dart';

import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/style_manager.dart';
import 'appointments_card_builder.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all( 10.0),
      decoration: StyleManager.containerDecoration,
      child: Column(
        children: [
          const Row(
            children: [
              ProfileImage(
                  height: 91,
                  width: 95
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: AppointmentsCardBuilder(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomMaterialButton(
                    text: "Details",
                    onPressed:  (){}
                ),
                SizedBox(width: 100,),
                CustomMaterialButton(
                    text: "Cancel",
                    onPressed:  (){}
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
