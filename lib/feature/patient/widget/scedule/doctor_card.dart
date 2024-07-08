import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinic_details_column.dart';

import '../../../../core/theme_manager/colors_manager.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({required this.clinicModel,super.key});
  final ClinicModel clinicModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorsManager.primaryLight2,
        borderRadius: StyleManager.borderRadius,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProfileImage(
                  height: 90,
                  width: 90,
                  url: clinicModel.imagePath,
              ),
              // Text(getNextDayTime(bookModel.appointmentModel!.dayName!,
              //     '${bookModel.appointmentModel!.from!.dateTime!.toDate().hour}:${bookModel.appointmentModel!.from!.dateTime!.toDate().minute}').toString()),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ClinicDetailsColumn(
                    clinicModel: clinicModel,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
