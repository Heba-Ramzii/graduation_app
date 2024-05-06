import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/function/core_function.dart';
import '../../../pages/profile/patient_profile.dart';
import '../../more/option_row.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionRow(
            icon: IconlyLight.notification,
            onTap:  (){
              //navigateToScreen(context, PatientProfileScreen());
            },
            text: "Notification Settings"
        ),
        OptionRow(
            icon: Icons.key,
            onTap:  (){},
            text: "Password manager"
        ),
        OptionRow(
            icon: IconlyLight.delete,
            onTap:  (){},
            text: "Delete Account"
        ),
      ],
    );
  }
}
