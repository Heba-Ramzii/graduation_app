import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
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
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.blue,
                      size: screenWidth * 0.06,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text(
                    "Add Card",
                    style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                "Payment",
                style: TextStyle(
                  color: ColorsManager.black,
                  fontSize: screenWidth * 0.06,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const AddPayment(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: CustomMaterialButton(
                  text: "Save",
                  onPressed: () {},
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
