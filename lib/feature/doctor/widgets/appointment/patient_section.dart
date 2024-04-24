import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/paient_list_builder.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class PatientSection extends StatelessWidget {
  const PatientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ListView.builder(
         shrinkWrap: true,
           itemBuilder: (context, index) => InkWell(
               child: const PatientListBuilder(),
             onTap: (){
               //Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentScreen()));
             },
           ),
         itemCount: 10,
        ),
      ],
    );
  }
}
