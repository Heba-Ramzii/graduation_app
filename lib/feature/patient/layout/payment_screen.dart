import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/feature/patient/layout/card_details.dart';

import '../widget/credit_card.dart';
import '../widget/payment_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: "Pay by Credit"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: const CreditCard(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.001),
              child: const PaymentCard(),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
              child: CustomMaterialButton(
                text: "New Payment Method",
                onPressed: () {
                  navigateToScreen(context, const CardDetails());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
