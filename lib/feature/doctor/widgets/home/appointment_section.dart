import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class AppointmentSection extends StatelessWidget {
  const AppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Today Appointment',
          style: StyleManager.mainTextStyle15,
        ),
        const SizedBox(height: 16,),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          padding: const EdgeInsets.all(12),
          decoration: StyleManager.containerDecoration,
          child:  Row(
            children: [
              const ProfileImage(
                height: 60,
                width:60 ,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Clinic Name',
                      style:StyleManager.textStyle14mid ,
                    ),
                    Text(
                      'Address',
                      style: StyleManager.textStyle12.copyWith(
                          fontSize: 13,
                          color: ColorsManager.primaryLight
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12 Patients',
                        style: StyleManager.textStyle12.copyWith(
                            fontSize: 13,
                            color: ColorsManager.primaryLight,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                    FontAwesomeIcons.bell
                ),
                color: ColorsManager.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
