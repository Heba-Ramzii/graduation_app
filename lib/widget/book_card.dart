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
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      child: ListTile(
        leading: Image.network(
          'https://as1.ftcdn.net/v2/jpg/03/02/88/46/1000_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg',
          width: screenWidth * 0.2, // Adjusted image width
          height: 400,
          fit: BoxFit.cover,
        ),
        title: Text(
          doctorName,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // Adjusted font size
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(department),
            SizedBox(
              height: screenWidth * 0.01, // Adjusted vertical spacing
            ),
            RatingBar.builder(
              initialRating: rating,
              itemSize: screenWidth * 0.06, // Adjusted star size
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
              height: screenWidth * 0.01, // Adjusted vertical spacing
            ),
            SizedBox(
              height: screenWidth * 0.12, // Adjusted button height
              width: screenWidth * 0.4, // Adjusted button width
              child: CustomMaterialButton(
                text: "BOOK",
                onPressed: () => print("book"),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Adjusted font size
                fontWeight: FontWeight.bold,
                color: ColorsManager.blue,
              ),
            ),
            Icon(
              Icons.money_sharp,
              color: ColorsManager.blue,
              size: screenWidth * 0.04, // Adjusted icon size
            ),
          ],
        ),
      ),
    );
  }
}
