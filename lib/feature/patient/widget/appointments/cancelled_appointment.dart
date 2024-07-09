import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/feature/patient/cubit/get_doctor_rebook_cubit/get_doctor_rebook_cubit.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/layout/scedule/schedule_screen.dart';
import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/theme_manager/style_manager.dart';
import 'appointments_card_builder.dart';

class CancelledAppointment extends StatelessWidget {
  const CancelledAppointment({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all(10.0),
      decoration: StyleManager.containerDecoration,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AppointmentsCardBuilder(bookModel: bookModel)),
          CustomMaterialButton(
              text: "Rebook",
              onPressed: () {
                GetDoctorRebookCubit.get(context)
                    .getDoctorRebook(doctorId: bookModel.doctorId!);
                goTo(
                    context,
                    RebookScreen(
                      doctorId: bookModel.doctorId!,
                    ));
              }),
        ],
      ),
    );
  }
}
