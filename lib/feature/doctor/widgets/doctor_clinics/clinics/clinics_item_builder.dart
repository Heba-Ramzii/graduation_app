import 'package:flutter/cupertino.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinic_details_column.dart';

import '../../../../../core/core_widgets/custom_material_button.dart';

class ClinicsItemBuilder extends StatelessWidget {
  const ClinicsItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all( 10.0),
      decoration: StyleManager.containerDecoration,
      child: Column(
        children: [
          const Row(
            children: [
              ProfileImage(
                  height: 91,
                  width: 95
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ClinicDetailsColumn(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 10),
            child: CustomMaterialButton(
                text: "Edit",
                onPressed:  (){}
            ),
          ),

        ],
      ),
    );
  }
}
