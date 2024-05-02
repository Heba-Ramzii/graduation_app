import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String department;
  final String time;
  final double rating;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.department,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(
        'https://as1.ftcdn.net/v2/jpg/03/02/88/46/1000_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg',
        width: 70,
        height: 400,
        fit: BoxFit.cover,
      ),
      title: Text(
        doctorName,
        maxLines: 1,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(department),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: rating,
              itemSize: 20,
              itemCount: 4,
              minRating: 1,
              direction: Axis.horizontal,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: ColorsManager.gold,
                size: 5,
              ),
              onRatingUpdate: (value) {
                print(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.alarm, color: ColorsManager.blue),
                Text(' $time'),
              ],
            ),
          ],
        ),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: ColorsManager.blue),
        ],
      ),
    ));
  }
}
