import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/feature/doctor/pages/appointment/appointment_screen.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/appointment_list_builder.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/clinic_info_section.dart';

import '../../../../../core/core_widgets/profile_image.dart';
import '../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../core/theme_manager/style_manager.dart';

class AppointmentSection extends StatelessWidget {
  const AppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today Appointment',
          style: StyleManager.mainTextStyle15
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height:130,
           child: ListView.separated(
            shrinkWrap: true,
             scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>  InkWell(
                child: AppointmentListBuilder(),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentScreen()));
              },
            ),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(
              width: 30,
            ),
          ),
        ),
      ],
    );
  }
}
