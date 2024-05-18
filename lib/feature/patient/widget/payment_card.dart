
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
       decoration: StyleManager.containerDecoration,
      child: Column(
         children: [
          CustomRadioButton(
            horizontal:true,
            height: 45,
            elevation: 0,
            unSelectedColor: Theme.of(context).canvasColor,
            buttonLables: const [
              'Month/20\$',
              'Year/200\$',
            ],
            buttonValues: const [
              "Month",
              "PARENT",
            ],
            shapeRadius: 10,
            padding: 5,
            enableShape: true,
            buttonTextStyle: const ButtonTextStyle(
                selectedColor: Colors.white,
                unSelectedColor: ColorsManager.font,
                textStyle: StyleManager.textStyle18),
            radioButtonValue: (value) {
            },
            selectedColor: ColorsManager.primary,
          ),
          CustomMaterialButton(
            minWidth: 200,
            text: 'PAY',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
