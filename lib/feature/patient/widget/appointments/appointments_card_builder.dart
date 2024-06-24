import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class AppointmentsCardBuilder extends StatelessWidget {
  const AppointmentsCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Clinic Name",
                  style: StyleManager.textStyle14.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "Respiratory",
                  style: StyleManager.textStyle12.copyWith(
                      color: ColorsManager.primaryLight
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                    Icons.attach_money_rounded,
                    size: 15,
                    color: ColorsManager.primaryLight3
                ),
                Text(
                  "150",
                  style: StyleManager.textStyle14mid.copyWith(
                    color: ColorsManager.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                  IconlyBold.location,
                  size: 20,
                  color: ColorsManager.primary

              ),
              const SizedBox(width: 5,),
              Text(
                "Germany medical center",
                style: StyleManager.textStyle12.copyWith(
                    color: ColorsManager.primaryLight
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "WED 24th Month",
              style: StyleManager.textStyle12.copyWith(
                  color: ColorsManager.primaryLight
              ),
            ),
            Row(
              children: [
                const Icon(
                    IconlyLight.timeCircle,
                    size: 16,
                    color: ColorsManager.primary,
                ),
                const SizedBox(width: 5,),
                Text(
                  "10:00 PM",
                  style: StyleManager.textStyle14.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],),

          ],),
      ],
    );
  }
}
