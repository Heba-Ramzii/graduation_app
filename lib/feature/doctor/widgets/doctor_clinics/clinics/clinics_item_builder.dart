import 'package:flutter/cupertino.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_appointment_cubit/get_clinic_appointment_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_cubit.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/pages/doctor_clinics/edit_clinic.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinic_details_column.dart';

import '../../../../../core/core_widgets/custom_material_button.dart';

class ClinicsItemBuilder extends StatelessWidget {
  const ClinicsItemBuilder({super.key, required this.clinicModel});

  final ClinicModel clinicModel;

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
              ProfileImage(
                height: 91,
                width: 95,
                url: clinicModel.imagePath,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ClinicDetailsColumn(
                    clinicModel: clinicModel,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
            child: CustomMaterialButton(
                text: "Edit",
                onPressed: () {
                  GetClinicAppointmentsCubit.get(context).getClinicAppointment(
                      clinicId: clinicModel.id!);
                  goTo(context, EditClinic(clinicModel: clinicModel));
                }),
          ),
        ],
      ),
    );
  }
}
