import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import '../../../../../core/theme_manager/style_manager.dart';
import '../../../../core/core_widgets/custom_outlined_button.dart';

class AIFeaturesSection extends StatelessWidget {
  const AIFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 16),
          child: Text(
            'AI Features',
            style: StyleManager.mainTextStyle15
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
         Container(
            padding: const EdgeInsets.all(20),
          decoration: StyleManager.containerDecoration,
          child:  Column(
             children: [
               const Text(
                'New AI Assistant',
                style: StyleManager.textStyle15light,
              ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16.0),
                 child:SvgPicture.asset(
                   'assets/images/Scan.svg',
                 )
               ),
               Row(
                children: [
                   const Text(
                    "Diagnose in seconds !",
                     style: StyleManager.textStyle15light,
                  ),
                   const Spacer(),
                   CustomOutlineButton(
                       text: "Try Now",
                       isIcon: true,
                       icon: Icons.arrow_forward_ios_rounded,
                       onPressed:(){},
                   ),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
