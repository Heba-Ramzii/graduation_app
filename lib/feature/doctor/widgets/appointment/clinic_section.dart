import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class ClinicSection extends StatelessWidget {
  const ClinicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Clinic Name',
              style:StyleManager.textStyle14mid ,
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const Icon(
                FontAwesomeIcons.calendarMinus,
                size: 20,
                color: ColorsManager.primary,
              ),

            ),
            const SizedBox(width: 10,),
            const Text(
              "16:00 - 22:00",
              style: StyleManager.textStyle12,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 20),
          child: Text(
            'Address',
            style: StyleManager.textStyle12.copyWith(
                 color: ColorsManager.primaryLight
            ),
          ),
        ),
      ],
    );
  }
}
