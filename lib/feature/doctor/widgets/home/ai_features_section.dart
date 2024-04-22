import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/appointment_list_builder.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/clinic_info_section.dart';

import '../../../../../core/core_widgets/profile_image.dart';
import '../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../core/theme_manager/style_manager.dart';

class AIFeaturesSection extends StatelessWidget {
  const AIFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 16),
          child: Text(
            'AI Features',
            style: StyleManager.mainTextStyle15
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
         Container(
           padding: const EdgeInsets.all(10),
          decoration: StyleManager.containerDecoration,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ClinicInfoSection(),
              Text(
                '12 Patients',
                style: StyleManager.textStyle12.copyWith(
                  fontSize: 13,
                  color: ColorsManager.primaryLight,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      FontAwesomeIcons.calendarMinus,
                      size: 20,
                      color: ColorsManager.primary,
                    ),

                  ),
                  const SizedBox(width: 8,),
                  const Text(
                    "16:00 - 22:00",
                    style: StyleManager.textStyle12,
                  )
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
