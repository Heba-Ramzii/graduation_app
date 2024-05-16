import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(80, 30, 60, 0),
          child: Container(
            width: 295,
            height: 211,
            decoration: ShapeDecoration(
              color: ColorsManager.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: ColorsManager.shadow,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 50, 0, 0),
          child: Column(
            children: [
              ToggleButtons(
                disabledBorderColor: ColorsManager.white,
                disabledColor: ColorsManager.white,
                selectedColor: ColorsManager.blue,
                borderWidth: 15,
                isSelected: const [true, false],
                direction: Axis.vertical,
                children: [
                  CustomMaterialButton(
                    text: "Month:        20 dollars",
                    fontColor:  ColorsManager.black,
                    onPressed: () {},
                    color: ColorsManager.white,
                  ),
                  CustomMaterialButton(
                    text: "year:        200 dollars",
                    fontColor:  ColorsManager.black,
                    onPressed: () {},
                    color: ColorsManager.white,
                    minWidth: 200,
                  ),
                ],
              ),
              CustomMaterialButton(
                minWidth: 200,
                text: 'PAY',
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
