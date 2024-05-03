import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UploadProcess extends StatefulWidget {
  const UploadProcess({super.key});

  @override
  State<UploadProcess> createState() => _UploadProcessState();
}

class _UploadProcessState extends State<UploadProcess> {
  double percent = 0;



  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(const Duration(milliseconds:1000),(_){
      setState(() {
        percent+=10;
        if(percent >= 100){
          timer?.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
        IconlyLight.document,
          weight: 100,
          color: ColorsManager.primaryLight4,
          size: 24,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text(
                        "Image_Chest",
                      style: StyleManager.textStyle12.copyWith(
                        fontSize: 10,
                        color: ColorsManager.font,
                        fontWeight: FontWeight.w500,
                      ),
                     ),
                      Text(
                       "$percent%",
                       style: StyleManager.textStyle12.copyWith(
                         fontSize: 10,
                         color: ColorsManager.grayFont,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 8,),
                 LinearPercentIndicator(
                   padding: const EdgeInsets.all(0),
                  //width: 350,
                  lineHeight: 2.0,
                  percent: percent/100,
                  progressColor: ColorsManager.primary,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
          Icons.close_rounded,
            weight: 20,
            color: ColorsManager.primaryLight4,
            size: 15,
          ),
        ),
      ],
    );
  }
}
