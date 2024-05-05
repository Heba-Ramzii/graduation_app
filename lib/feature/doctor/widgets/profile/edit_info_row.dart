import 'package:flutter/material.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';


class EditInfoRow extends StatelessWidget {
   EditInfoRow({
    super.key,
     required this.title,
    required  this.controller,
    required this.inputType,
   });
  final String title;
   final TextEditingController controller;
  final TextInputType  inputType;
  String value = "";


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor:ColorsManager.primary ,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
               labelText: title,
             focusColor: ColorsManager.primary,
             labelStyle:const TextStyle(
               fontSize: 14,
             ) ,
              //hintText: title,

             ),
            onChanged: (text) {
              value = text;
            },
          ),        ],
      ),
    );
  }
}

