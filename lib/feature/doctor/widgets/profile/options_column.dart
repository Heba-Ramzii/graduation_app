import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/option_row.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class OptionsColumn extends StatelessWidget {
  const OptionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionRow(
            icon: IconlyLight.profile,
            onTap:  (){},
            text: "Profile"
        ),
        OptionRow(
            icon: Icons.favorite_border_rounded,
            onTap:  (){},
            text: "Favorite"
        ),
        OptionRow(
            icon: Icons.add_business_outlined,
            onTap:  (){},
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
            onTap:  (){},
            text: "Settings"
        ),
        OptionRow(
            icon: Icons.help_outline_rounded,
            onTap:  (){},
            text: "Help Center "
        ),
        SizedBox(height: 17,),
        Row(
          children: [
            const Icon(
              IconlyLight.logout,
              size: 25,
              color: ColorsManager.red,
            ),
            const SizedBox(width: 40,),
            Text(
              "Log Out",
              style: StyleManager.mainTextStyle15.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),

          ],
        )
      ],
    );
  }
}
