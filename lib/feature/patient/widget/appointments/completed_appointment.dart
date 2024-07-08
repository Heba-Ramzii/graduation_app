import 'package:flutter/material.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/function/core_function.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../layout/appointments/add_review_screen.dart';
import 'appointments_card_builder.dart';

class CompletedAppointment extends StatelessWidget {
  const CompletedAppointment({super.key, required this.bookModel});
  final BookModel bookModel ;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomMaterialButton(
                  minWidth: 185,
                    text: "Rebook",
                    onPressed:  (){}
                ),
                //SizedBox(width: 100,),
                CustomMaterialButton(
                    minWidth: 185,
                    text: "Add review",
                    onPressed:  (){
                      navigateToScreen(context, const AddReviewScreen(),);
                    }
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
