import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class BookCard extends StatelessWidget {
  final String doctorName;
  final String department;
  final String price;
  final double rating;
  const BookCard({
    required this.doctorName,
    required this.department,
    required this.price,
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
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(department),
          const SizedBox(
            height: 10,
          ),
          RatingBar.builder(
            initialRating: 2,
            itemSize: 30,
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 200,
                child: CustomMaterialButton(
                  text: "BOOK",
                  onPressed: () => print("book"),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '150',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.blue),
          ),
          Icon(
            Icons.money_sharp,
            color: ColorsManager.blue,
            size: 20,
          ),
        ],
      ),
    ));
  }
}
