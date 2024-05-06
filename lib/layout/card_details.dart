import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/addPayment_card.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorsManager.blue,
                  ),
                ),
                Text(
                  "     Add Card",
                  style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AddPayment(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: CustomMaterialButton(
                      text: "Save",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
