import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
         margin: const EdgeInsets.symmetric(vertical: 40),
         decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(colors: [
          ColorsManager.purple,
          ColorsManager.purple,
        ]),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/visa.svg',
                height: 40,
                width: 40,
              ),
              const Spacer(),
              const Icon(
                  Icons.more_horiz_rounded,
                size: 24,
                color: ColorsManager.white,
              )
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
          const Row(
            children: [
              Text(
                "CARD HOLDER",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                "EXPIRES ",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 12,
                ),
              ),

            ],),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              Text(
                "Lindsey Johnson",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
              Spacer(),
              Text(
                "05/25",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 16,
                  fontWeight: FontWeight.w500
                 ),
              ),

            ],
          ),
        ],
      ),

    );
  }
}
