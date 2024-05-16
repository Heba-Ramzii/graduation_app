import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/feature/doctor/widgets/more/option_row.dart';
import 'package:graduation_app/feature/patient/layout/payment_screen.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../doctor/pages/more/profile/patient_profile.dart';
import '../../../doctor/pages/more/settings/settings_screen.dart';

class PatientOptionsColumn extends StatelessWidget {
  const PatientOptionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionRow(
            icon: IconlyLight.profile,
            onTap: () {
              navigateToScreen(context, const PatientProfileScreen());
            },
            text: "Profile"),
        OptionRow(
            icon: Icons.favorite_border_rounded,
            onTap: () {},
            text: "Favorite"),
        OptionRow(
            icon: Icons.payment_rounded,
            onTap: () {
              navigateToScreen(context, const PaymentScreen());
            },
            text: "Payments"),
        OptionRow(
            icon: Icons.settings_outlined,
            onTap: () {
              navigateToScreen(context, const SettingsScreen());
            },
            text: "Settings"),
        OptionRow(
            icon: Icons.help_outline_rounded,
            onTap: () {},
            text: "Help Center "),
        const SizedBox(
          height: 17,
        ),
        Row(
          children: [
            const Icon(
              IconlyLight.logout,
              size: 25,
              color: ColorsManager.red,
            ),
            const SizedBox(
              width: 40,
            ),
            CustomTextButton(
              text: "Log Out",
              onPressed: () {
                showMyDialog(context, "Log Out", "Yes, Log Out", () {});
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
