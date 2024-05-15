import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class CereditCard extends StatelessWidget {
  const CereditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(60),
          child: Container(
            width: 320,
            height: 174,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: const LinearGradient(colors: [
                ColorsManager.purple,
                ColorsManager.purple,
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/visa.svg',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  SvgPicture.asset(
                    'assets/icons/dots-horizontal.svg',
                    color: ColorsManager.white,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              const Text(
                "****    ****    ****    1234",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "CARD HOLDER                                                    EXPIRES ",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Lindsey Johnson                             05/25 ",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
