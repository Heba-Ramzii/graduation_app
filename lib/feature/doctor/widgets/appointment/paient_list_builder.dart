 import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class PatientListBuilder extends StatelessWidget {
  const PatientListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 400,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: StyleManager.containerDecoration,
      child: Row(
         children: [
          const ProfileImage(
            height: 46,
            width:42 ,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      const Text(
                        'Patient Name',
                        style:StyleManager.textStyle14mid ,
                      ),
                     //const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          '1',
                          style: StyleManager.textStyle12.copyWith(
                              fontSize: 13,
                              color: ColorsManager.primaryLight
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Take After Meal',
                    style: StyleManager.textStyle12.copyWith(
                        fontSize: 13,
                        color: ColorsManager.primaryLight
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.clock,
                            size: 15,
                            color: ColorsManager.primary,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "8:45 AM",
                            style: StyleManager.textStyle12.copyWith(
                                color: ColorsManager.primaryLight
                            ),
                          ),
                        ],
                      ),
                      //const Spacer(),
                      const Icon(
                        IconlyBold.download,
                        color: ColorsManager.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         ],
      ),
    );
  }
}
