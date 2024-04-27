import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import '../../../../../core/core_widgets/rate_clinic.dart';
import '../../../../../core/theme_manager/colors_manager.dart';

class ClinicDetailsColumn extends StatelessWidget {
  const ClinicDetailsColumn({super.key});

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
                  size: 13,
                    color: ColorsManager.primaryLight3
                ),
                Text(
                    "150",
                  style: StyleManager.textStyle12.copyWith(
                      color: ColorsManager.primary
                  ),
                ),
              ],
            ),
          ],
        ),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                  IconlyBold.location,
                size: 16,
                  color: ColorsManager.primaryLight3

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
            const RateClinic(),
            Text(
                "42 Reviews",
              style: StyleManager.textStyle12.copyWith(
                  color: ColorsManager.primaryLight
              ),
            ),
          ],
        ),

      ],
    );
  }
}
