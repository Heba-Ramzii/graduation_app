import 'package:flutter/material.dart';

import '../../../../../core/core_widgets/profile_image.dart';
import '../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../core/theme_manager/style_manager.dart';

class ClinicInfoSection extends StatelessWidget {
  const ClinicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       const ProfileImage(
         height: 60,
         width:60 ,
       ),
       SizedBox(
         height: 60,
         child: Padding(
           padding: const EdgeInsets.only(left: 18.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
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
             ],
           ),
         ),
       ),
     ],
            );
  }
}
