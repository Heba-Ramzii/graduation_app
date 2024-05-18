import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/layout/signup_screen.dart';
import 'package:graduation_app/generated/assets.dart';

import '../../../core/function/core_function.dart';
import '../../../core/theme_manager/colors_manager.dart';

class OnboardingScreen extends StatelessWidget {
    const OnboardingScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Assets.imagesLogo,
                height: 120,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'Welcome in our app\n Your Trusted Healthcare Companion',
                style: StyleManager.textStyle18,
                textAlign: TextAlign.center,
              ),
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                   children: [
                     Container(
                       width: 100,
                       height: 100,
                       margin: const EdgeInsets.only(bottom: 10,top: 10),
                       decoration: StyleManager.containerDecoration,
                       child: SvgPicture.asset(
                           Assets.imagesDoctorFilesMedicalSvgrepoCom,
                         fit: BoxFit.contain,
                         color: ColorsManager.primary,
                         //width: 180,
                       ),
                     ),
                     CustomMaterialButton(
                       minWidth:180,
                       height: 60,
                       text: "Doctor",
                       style: StyleManager.textStyle18.copyWith(
                           fontWeight: FontWeight.w500,
                           color: ColorsManager.white
                       ),
                       onPressed: () {
                         navigateToScreen(context,  const SignupScreen(isDoctor: true,));
                       },
                     ),
                   ],
                 ),
                 const SizedBox(width: 20,),
                 Column(
                   children: [
                     Container(
                       width: 100,
                       padding: const EdgeInsets.all(15),
                       margin: const EdgeInsets.only(bottom: 10,top: 10),
                       decoration: StyleManager.containerDecoration,
                       child: Image.asset(
                         Assets.imagesPatient2,
                       ),
                     ),
                     CustomMaterialButton(
                         minWidth:180,
                         height: 60,
                         text: "Patient",
                         style: StyleManager.textStyle18.copyWith(
                             fontWeight: FontWeight.w500,
                             color: ColorsManager.white
                         ),
                         onPressed: () {
                           navigateToScreen(context,  const SignupScreen(isDoctor: false, ));
                         }
                     ),
                   ],
                 ),
               ],
             )

          ],
        ),
      ),
    );
  }
}
