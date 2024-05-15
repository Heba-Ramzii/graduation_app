import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class PatientInfoSection extends StatelessWidget {
  const PatientInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Patient Name',
              style:StyleManager.textStyle14mid ,
            ),
            const Spacer(),
            Text(
              '1st',
              style: StyleManager.textStyle12.copyWith(
                  color: ColorsManager.primaryLight
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 28),
          child:Row(
            children: [
              const Icon(
                FontAwesomeIcons.calendarMinus,
                size: 20,
                color: ColorsManager.primary,
              ),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 5.0),
                 child: Text(
                  "12-Feb-2024",
                  style: StyleManager.textStyle12,
                               ),
               ),
                Text(
                "9:45 AM",
                style: StyleManager.textStyle12.copyWith(
                  color: ColorsManager.primaryLight3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
