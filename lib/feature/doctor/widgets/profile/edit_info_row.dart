import 'package:flutter/material.dart';

import '../../../../core/theme_manager/colors_manager.dart';


// ignore: must_be_immutable
class EditInfoRow extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType  inputType;
  final IconData? icon;
  final bool readOnly ;
  final Function()? onTap;
  String value = "";
  bool isNumber;

   EditInfoRow({
    super.key,
    required this.title,
    required  this.controller,
    required this.inputType,
     this.icon,
     this.onTap,
     this.readOnly= false,
     this.isNumber=false,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            readOnly: readOnly,  //set it true, so that user will not able to edit text
            cursorColor:ColorsManager.primary ,
            controller: controller,
            keyboardType: inputType,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              }
              else if(isNumber && int.tryParse(value)==null){
                return 'This field must be a integer number';
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: onTap,
                child:  Icon(
                  icon,
                  color: ColorsManager.primaryLight4,
                ),
              ),
               labelText: title,
             focusColor: ColorsManager.primary,
             labelStyle:const TextStyle(fontSize: 14,) ,
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

