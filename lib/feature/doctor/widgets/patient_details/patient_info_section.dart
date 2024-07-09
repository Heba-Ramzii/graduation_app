import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class PatientInfoSection extends StatelessWidget {
  const PatientInfoSection(
      {super.key, required this.patientBookModel, required this.index});
  final PatientBookModel patientBookModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              patientBookModel.patientName ?? '',
              style: StyleManager.textStyle14mid,
            ),
            const Spacer(),
            Text(
              '${index + 1}',
              style: StyleManager.textStyle12
                  .copyWith(color: ColorsManager.primaryLight),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 28),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.calendarMinus,
                size: 20,
                color: ColorsManager.primary,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "${patientBookModel.dateTime!.toDate().day}-${patientBookModel.dateTime!.toDate().month}-${patientBookModel.dateTime!.toDate().year}",
                  style: StyleManager.textStyle12,
                ),
              ),
              Text(
                "${patientBookModel.dateTime!.toDate().hour}:${patientBookModel.dateTime!.toDate().minute}",
                style: StyleManager.textStyle12.copyWith(
                  color: ColorsManager.primaryLight3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
