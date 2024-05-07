import 'package:flutter/material.dart';

import '../../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../../core/theme_manager/style_manager.dart';
import '../../../profile/edit_info_row.dart';

class AppointmentContainer extends StatelessWidget {
   AppointmentContainer({super.key});
  final dayController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding:  const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius:StyleManager.borderRadius,
      ),
      child: Column(
        children: [
          EditInfoRow(
            readOnly: true,
            title: "Day",
            controller: dayController,
            inputType: TextInputType.text,
            onTap: () {},
            icon: Icons.keyboard_arrow_down_rounded,
          ),
           Row(
             children: [
              Expanded(
                child: EditInfoRow(
                   title: "From",
                  controller: fromController,
                  inputType: TextInputType.text,
                  onTap: () {},
                 ),
              ),
               const SizedBox(width: 15,),
               Expanded(
                 child: EditInfoRow(
                    title: "To",
                   controller: toController,
                   inputType: TextInputType.text,
                   onTap: () {},
                  ),
               ),
            ],
          ),
        ],
      ),
    );
  }
}
