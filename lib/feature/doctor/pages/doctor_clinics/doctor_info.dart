import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/info/info_container.dart';

import '../../widgets/info/file_container.dart';


class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
          title: "Info",
        actionIcon: Icons.done_rounded,
        actionTap: (){},
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const InfoContainer(),
            const SizedBox(height: 17,),
            FileContainer(),
          ],
        ),
      ),
    );
  }
}
