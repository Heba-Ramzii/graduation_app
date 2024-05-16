import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
           decoration: StyleManager.containerDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ToggleButtons(
                disabledBorderColor: ColorsManager.white,
                disabledColor: ColorsManager.white,
                selectedColor: ColorsManager.primary,
                borderWidth: 15,
                isSelected: const [true, false],
                direction: Axis.vertical,
                children: [
                  CustomMaterialButton(
                    text: "Month/20\$",
                    fontColor:  ColorsManager.black,
                    onPressed: () {},
                    color: ColorsManager.white,
                  ),
                  CustomMaterialButton(
                    text: "Year/200\$",
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
