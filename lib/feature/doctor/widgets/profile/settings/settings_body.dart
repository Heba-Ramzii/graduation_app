import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/feature/doctor/pages/more/settings/password_manager_screen.dart';

import '../../../../../core/function/core_function.dart';
import '../../../pages/more/settings/notification _settings_screen.dart';
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
              navigateToScreen(context, const NotificationSettingsScreen());
            },
            text: "Notification Settings"
        ),
        OptionRow(
            icon: Icons.key,
            onTap:  (){
              navigateToScreen(context,const PasswordManagerScreen());
            },
            text: "Password manager"
        ),
        OptionRow(
            icon: IconlyLight.delete,
            onTap:  (){
              showMyDialog(
                  context, "Delete Account",
                  "Yes, Delete",
                      (){}

              );
            },
            text: "Delete Account"
        ),
      ],
    );
  }
}
