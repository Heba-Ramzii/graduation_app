import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import '../../../core/theme_manager/style_manager.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String department;
  final String time;
  final double rating;

  const AppointmentCard({
    Key? key,
    required this.doctorName,
    required this.department,
    required this.time,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration:StyleManager.containerDecoration ,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImage(
              url:'https://as1.ftcdn.net/v2/jpg/03/02/88/46/1000_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg',
                height: 70, width: 70
            )   ,
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    department,
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorsManager.font,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: rating,
                    itemSize: 20,
                    itemCount: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ColorsManager.gold,
                    ),
                    onRatingUpdate: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.alarm, color: ColorsManager.blue),
                      const SizedBox(width: 4),
                      Text(time),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: ColorsManager.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
