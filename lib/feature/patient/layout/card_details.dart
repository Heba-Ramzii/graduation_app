import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/layout/payment_screen.dart';

import '../widget/addPayment_card.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Card"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment",
                style: StyleManager.buttonTextStyle16.copyWith(
                  color: ColorsManager.font,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const Center(child: AddPayment()),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              Center(
                child: CustomMaterialButton(
                  text: "Save",
                  onPressed: () {
                    navigateToScreen(context, const PaymentScreen());
                  },
                  minWidth: screenWidth * 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
