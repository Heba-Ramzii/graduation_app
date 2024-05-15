import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class NotificationSettingsRowBuilder extends StatelessWidget {
  const NotificationSettingsRowBuilder({
    super.key,
    required this.status,
    required this.title,
    required this.onToggle}
      );
  final bool status ;
  final String title ;
  final Function(bool) onToggle ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: StyleManager.textStyle14mid,
          ),
          FlutterSwitch(
            activeColor: const Color(0xff3687FF),
            inactiveColor: ColorsManager.switcH,
            width: 50.0,
            height: 28.0,
            toggleSize: 24.0,
            value: status,
            borderRadius: 40.0,
            padding: 2.0,
             onToggle: onToggle,
          ),

        ],
      ),
    );
  }
}
