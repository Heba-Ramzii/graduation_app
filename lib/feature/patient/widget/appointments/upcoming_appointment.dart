import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/widget/scedule/details.dart';
import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/theme_manager/style_manager.dart';
import 'appointments_card_builder.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key, required this.bookModel, required this.patientBookModel});
  final BookModel bookModel ;
  final PatientBookModel patientBookModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all( 10.0),
      decoration: StyleManager.containerDecoration,
      child: Column(
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppointmentsCardBuilder(bookModel: bookModel)

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0,),
            child: CustomMaterialButton(
                //minWidth: 185,
                text: "Details",
                onPressed:  (){
                  goTo(
                    context,
                    DetailsScreen(
                      bookModel: bookModel,
                        patientBookModel: patientBookModel
                    ),
                  );
                }
            ),
          ),

        ],
      ),
    );
  }
}

// CustomMaterialButton(
//     minWidth: 185,
//     text: "Cancel",
//     onPressed:  (){
//       navigateToScreen(context, const CancelAppointmentScreen(),);
//     }
// ),