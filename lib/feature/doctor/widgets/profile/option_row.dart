import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';

class OptionRow extends StatelessWidget {
  const OptionRow({
    super.key,
    required this.icon,
    required this.onTap, required this.text,
  });
  final IconData icon;
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0),
      child: Row(
         children: [
          Icon(
              icon,
            size: 25,
            color: ColorsManager.primaryLight4,
          ),
          const SizedBox(width: 40,),
          Text(
            text,
            style: StyleManager.mainTextStyle15.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){},
            child: const Icon(
                IconlyLight.arrowRight,
              size: 24,
              color: ColorsManager.primaryLight4,
            ),
          ),
        ],
      ),
    );
  }
}
