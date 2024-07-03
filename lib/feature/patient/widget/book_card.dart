import 'package:flutter/cupertino.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinic_details_column.dart';
import 'package:graduation_app/feature/patient/layout/scedule/schedule_screen.dart';

import '../../../../../core/core_widgets/custom_material_button.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all(10.0),
      decoration: StyleManager.containerDecoration,
      child: Column(
        children: [
          Row(
            children: [
              ProfileImage(height: 91, width: 95),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ClinicDetailsColumn(
                    clinicModel: ClinicModel(
                      name: 'test',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
            child: CustomMaterialButton(
                text: "Book",
                onPressed: () {
                  navigateToScreen(context, const SchedualScreen());
                }),
          ),
        ],
      ),
    );
  }
}
