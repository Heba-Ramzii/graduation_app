import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/clinic_info_section.dart';

 import '../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../core/theme_manager/style_manager.dart';

class AppointmentListBuilder extends StatelessWidget {
  const AppointmentListBuilder({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
         width: 270,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: StyleManager.containerDecoration,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             ClinicInfoSection(data:data,),
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
                 Text(
                  '${data['fromTime']} : ${data['toTime']}',
                  style: StyleManager.textStyle12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
