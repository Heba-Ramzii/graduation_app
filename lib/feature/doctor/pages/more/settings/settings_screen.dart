import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/settings/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          title: "Settings"
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0,),
        child: SettingsBody(),
      ),
    );
  }
}
