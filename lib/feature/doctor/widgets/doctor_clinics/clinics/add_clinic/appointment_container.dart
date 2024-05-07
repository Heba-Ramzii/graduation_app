import 'package:flutter/material.dart';

import '../../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../../core/theme_manager/style_manager.dart';
import '../../../profile/edit_info_row.dart';

class AppointmentContainer extends StatelessWidget {
   AppointmentContainer({super.key});
  final dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Appointments",
            style: StyleManager.mainTextStyle15,
          ),
        ),
        Container(
          padding:  const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius:StyleManager.borderRadius,
          ),
          child:  Column(
            children: [
              EditInfoRow(
                readOnly: true,
                title: "Day",
                controller: dayController,
                inputType: TextInputType.datetime,
                onTap: () {},
                icon: Icons.keyboard_arrow_down_rounded,
              ),

            ],
          ),
        ),
      ],
    );
  }
}
