import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:graduation_app/feature/patient/layout/appointments/cancel_screen.dart';

import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/function/core_function.dart';
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomMaterialButton(
                    minWidth: 185,
                    text: "Details",
                    onPressed:  (){}
                ),
                CustomMaterialButton(
                    minWidth: 185,
                    text: "Cancel",
                    onPressed:  (){
                      navigateToScreen(context, const CancelAppointmentScreen().animate().fade().scale(),);
                    }
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
