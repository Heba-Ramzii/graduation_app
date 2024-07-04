import 'package:flutter/material.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class TimeColumn extends StatelessWidget {
  const TimeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0,top: 32),
          child: Divider(
            color: ColorsManager.primary,
            thickness: 1,
          ),
        ),
        Text(
          "12 , Month , 2022",
          style: StyleManager.textStyle14.copyWith(
            color: ColorsManager.primary,
          ),
        ),
        const SizedBox(height: 16,),
        Text(
          "WED , 10:00 PM",
          style: StyleManager.textStyle14.copyWith(
            color: ColorsManager.primary,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0,top: 32),
          child: Divider(
            color: ColorsManager.primary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
