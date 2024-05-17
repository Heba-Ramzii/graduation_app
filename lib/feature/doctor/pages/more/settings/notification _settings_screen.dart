import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/settings/notification_settings_row_builder.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool status1 = false;
    bool status2 = false;
    bool status3 = false;
    bool status4 = false;
    bool status5 = false;
    bool status6 = false;

    return Scaffold(
      appBar: const CustomAppBar(title: "Notification Settings"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            NotificationSettingsRowBuilder(
                status: status1,
                title: "General Notification",
              onToggle:  (val) {
                setState(() {
                  status1 = val;
                });
              },
            ),
            NotificationSettingsRowBuilder(
                status: status2,
                title: "Sound",
              onToggle:  (val) {
                setState(() {
                  status2 = val;
                });
              },
            ),
            NotificationSettingsRowBuilder(
                status: status3,
                title: "Call Sound",
              onToggle:  (val) {
                setState(() {
                  status3 = val;
                });
              },
            ),
            NotificationSettingsRowBuilder(
                status: status4,
                title: "Vibrate",
              onToggle:  (val) {
                setState(() {
                  status4 = val;
                });
              },
            ),
            NotificationSettingsRowBuilder(
                status: status5,
                title: "Payments",
              onToggle:  (val) {
                setState(() {
                  status5 = val;
                });
              },
            ),
            NotificationSettingsRowBuilder(
                status: status6,
                title: "Special offer",
                onToggle:  (val) {
                  setState(() {
                    status6 = val;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
