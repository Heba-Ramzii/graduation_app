import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';

import '../../../../../core/core_widgets/rate_clinic.dart';
import '../../../../../core/theme_manager/colors_manager.dart';

class ClinicDetailsColumn extends StatelessWidget {
  const ClinicDetailsColumn({super.key, required this.clinicModel});
  final ClinicModel clinicModel;

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
                  clinicModel.name ?? '',
                  style: StyleManager.textStyle14
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                // Text(
                //   "Respiratory",
                //   style: StyleManager.textStyle12
                //       .copyWith(color: ColorsManager.primaryLight),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              child: Row(
                children: [
                  Text(
                    '${clinicModel.price.toString()}.LE',
                    style: StyleManager.textStyle14mid.copyWith(
                      color: ColorsManager.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(IconlyBold.location,
                  size: 16, color: ColorsManager.primaryLight3),
              const SizedBox(
                width: 5,
              ),
              Text(
                clinicModel.address ?? '',
                style: StyleManager.textStyle12
                    .copyWith(color: ColorsManager.primaryLight),
              ),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const RateClinic(),
        //     Text(
        //       "42 Reviews",
        //       style: StyleManager.textStyle12
        //           .copyWith(color: ColorsManager.primaryLight),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
