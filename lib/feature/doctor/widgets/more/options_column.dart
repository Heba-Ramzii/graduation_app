import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/feature/doctor/widgets/more/option_row.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../pages/doctor_clinics/add_clinic.dart';
import '../../pages/more/profile/patient_profile.dart';
import '../../pages/more/settings/settings_screen.dart';

class OptionsColumn extends StatelessWidget {
  const OptionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionRow(
            icon: IconlyLight.profile,
            onTap:  (){
              navigateToScreen(context, const PatientProfileScreen());
            },
            text: "Profile"
        ),
        OptionRow(
            icon: Icons.favorite_border_rounded,
            onTap:  (){},
            text: "Favorite"
        ),
        OptionRow(
            icon: Icons.add_business_outlined,
            onTap:  (){
              navigateToScreen(context, const AddClinic());
            },
            text: "Add clinic"
        ),
        OptionRow(
            icon: Icons.payment_rounded,
            onTap:  (){},
            text: "Payments"
        ),
        OptionRow(
            icon: IconlyLight.lock,
            onTap:  (){},
            text: "Privacy & Policy"
        ),
        OptionRow(
            icon: Icons.settings_outlined,
            onTap:  (){
              navigateToScreen(context, const SettingsScreen());
            },
            text: "Settings"
        ),
        OptionRow(
            icon: Icons.help_outline_rounded,
            onTap:  (){},
            text: "Help Center "
        ),
        const SizedBox(height: 17,),
        Row(
          children: [
            const Icon(
              IconlyLight.logout,
              size: 25,
              color: ColorsManager.red,
            ),
            const SizedBox(width: 40,),
            CustomTextButton(
              text:"Log Out",
              onPressed: () {
                showMyDialog(context, "Log Out",
                    "Yes, Log Out",
                        (){}

                );
               },
              fontSize: 18,
                fontWeight: FontWeight.w500,
              fontColor: ColorsManager.font,
            ),

          ],
        )
      ],
    );
  }
}
