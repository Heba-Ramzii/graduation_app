import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class PatientNote extends StatelessWidget {
  const PatientNote({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15.0,),
          child: Text(
            'Patient Note',
            style: StyleManager.textStyle14,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorsManager.primaryLight2,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Row(
            children: [
              Icon(
                IconlyBold.infoCircle,
              ),
              SizedBox(width: 6,),
              Text(
                  "Patient message...",
                  style: StyleManager.textStyle12.copyWith(
                    color: ColorsManager.primaryLight,
                  )
              ),
            ],
          ),

        ),

      ],
    );
  }
}
