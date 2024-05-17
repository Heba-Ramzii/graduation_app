import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/paient_list_builder.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../pages/patient_details/patient_details_screen.dart';

class PatientAppointmentList extends StatelessWidget {
  const PatientAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Patients',
                style: StyleManager.textStyle14,
              ),
              const Spacer(),
              Text(
                '7 Patients',
                style: StyleManager.textStyle12.copyWith(
                  fontSize: 13,
                  color: ColorsManager.primaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
             shrinkWrap: true,
               itemBuilder: (context, index) => InkWell(
                   child: const PatientListBuilder(),
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context)
                           => const PatientDetailsScreen()
                   ),
                   );
                 },
               ),
             itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
