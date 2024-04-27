import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/theme_manager/colors_manager.dart';

class RateClinic extends StatefulWidget {
  const RateClinic({Key? key}) : super(key: key);

  @override
  State<RateClinic> createState() => _RateClinicState();
}

class _RateClinicState extends State<RateClinic> {
  // The rating value
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Column(
           children: [
             RatingBar(
               itemSize: 20,
                 initialRating: 0,
                 direction: Axis.horizontal,
                 allowHalfRating: false,
                 itemCount: 5,
                 ratingWidget: RatingWidget(
                     full: const Icon(
                         IconlyBold.star,
                         color: ColorsManager.gold
                     ),
                     half: const Icon(
                       IconlyBold.star,
                       color: ColorsManager.gold,
                     ),
                     empty: const Icon(
                       IconlyLight.star,
                       color: ColorsManager.gold,
                     )),
                 onRatingUpdate: (value) {
                   setState(() {
                     _ratingValue = value;
                   });
                   print("******** Rate $value **************");
                 }),
           ],
         );
  }
}