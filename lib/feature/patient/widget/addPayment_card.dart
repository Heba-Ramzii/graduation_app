import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:StyleManager.containerDecoration,
      margin:const EdgeInsets.all(12.0) ,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          CustomTextFormField(
            type: TextInputType.text,
            label: "Full Name",
            hint: "Someone",
          ),
          CustomTextFormField(
            type: TextInputType.number,
            label: "Card Number",
            hint: "0000 0000 0000",
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  type: TextInputType.number,
                  label: "Expire Date",
                  hint: "00/00",
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomTextFormField(
                  type: TextInputType.number,
                  label: "CVV",
                  hint: "000",
                ),
              ),
            ],
          ),
           CustomTextFormField(
            type: TextInputType.text,
            label: "Address",
            hint: "Street 00",
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
