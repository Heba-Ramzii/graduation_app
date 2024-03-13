import 'package:flutter/material.dart';

import 'colors_manager.dart';

abstract class StyleManager {
  // title
  static const textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  // button text light
  static const textStyleLight30 = TextStyle(
      fontSize: 30,
    fontWeight: FontWeight.bold,
  );

   static const textStyleDark30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  // Nav bar text
  static const textStyleDark18 = TextStyle(fontSize: 18,);

   static const textStyleLight18 = TextStyle(
      fontSize: 18,
     fontWeight: FontWeight.bold,
   );

  static const textStyleDark16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
      fontWeight: FontWeight.bold,


  );

  static const textStyle14 = TextStyle(
      fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  //label
  static const textStyle12 = TextStyle(
      fontSize: 12,
      color: ColorsManager.primary
  );

}
