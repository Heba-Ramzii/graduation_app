import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class EditInfoRow extends StatelessWidget {
  EditInfoRow({
    super.key,
    required this.title,
    required this.controller,
    required this.inputType,
    this.icon,
    this.onTap,
    this.readOnly = false,
  });
  final String title;
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData? icon;
  final bool readOnly;
  final Function()? onTap;
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            readOnly:
                readOnly, //set it true, so that user will not able to edit text
            cursorColor: ColorsManager.primary,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: onTap,
                child: Icon(
                  icon,
                  color: ColorsManager.primaryBorder,
                ),
              ),
              labelText: title,
              focusColor: ColorsManager.primary,
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
            onChanged: (text) {
              value = text;
            },
          ),
        ],
      ),
    );
  }
}
