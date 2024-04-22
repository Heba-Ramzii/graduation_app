import 'package:flutter/material.dart';

import 'colors_manager.dart';

abstract class StyleManager {
  // title
  static const textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static const buttonTextStyle16 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.white);

  static const mainTextStyle15 = TextStyle(
    fontSize: 15,
  );

  static const warringTextStyle15 = TextStyle(
    fontSize: 15,
    color: ColorsManager.red,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
  );

  static const textStyle14mid = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  //label
  static const textStyle12 =
      TextStyle(fontSize: 12, color: ColorsManager.primary);


  static const shadow = BoxShadow(
    color: ColorsManager.primaryLight,
    blurRadius: 4,
    offset: Offset(0, 2),
  );
  static BorderRadius borderRadius = BorderRadius.circular(10);
  static  BoxDecoration containerDecoration = BoxDecoration(
    color: ColorsManager.white,
    borderRadius: borderRadius,
    boxShadow:  const [
      StyleManager.shadow
    ],
  );
}
