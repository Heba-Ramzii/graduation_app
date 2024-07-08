import 'package:flutter/material.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key, required this.patientBookModel});
  final PatientBookModel patientBookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                "Booking for",
                style: StyleManager.textStyle14.copyWith(
                  color: ColorsManager.grayFont,
                ),
              ),
              const Spacer(),
              Text(
                patientBookModel.isSelf! ? "Your Self" : "Another Person",
                style: StyleManager.textStyle14,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                "Full Name",
                style: StyleManager.textStyle14.copyWith(
                  color: ColorsManager.grayFont,
                ),
              ),
              const Spacer(),
              Text(
                patientBookModel.patientName ?? "",
                style: StyleManager.textStyle14,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                "Age",
                style: StyleManager.textStyle14.copyWith(
                  color: ColorsManager.grayFont,
                ),
              ),
              const Spacer(),
              Text(
                patientBookModel.age.toString(),
                style: StyleManager.textStyle14,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              "Gender",
              style: StyleManager.textStyle14.copyWith(
                color: ColorsManager.grayFont,
              ),
            ),
            const Spacer(),
            Text(
              patientBookModel.isMale! ? "Male" : "Female",
              style: StyleManager.textStyle14,
            ),
          ],
        ),

        const Padding(
          padding: EdgeInsets.only(bottom: 16.0,top: 32),
          child: Divider(
            color: ColorsManager.primary,
            thickness: 1,
          ),
        ),
        Text(
          "Problem",
          style: StyleManager.textStyle14.copyWith(
            color: ColorsManager.grayFont,
          ),
        ),
        const SizedBox(height: 8,),
        Text(
          patientBookModel.description ?? "",
          maxLines: null,
          style: StyleManager.textStyle14.copyWith(
            color: ColorsManager.grayFont,
          ),
        ),

      ],
    );
  }
}
