import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/credit_card.dart';
import 'package:graduation_app/widget/payment_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
                  "     Pay by credit",
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
            CereditCard(),
            PaymentCard(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: CustomMaterialButton(
                text: "New Paymet Method",
                onPressed: () {},
              ),
            ),
          ],
        ),
      )),
    );
  }
}
