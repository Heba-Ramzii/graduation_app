import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class ReminderCard extends StatelessWidget {
  final Widget medication;
  final String time;
  final Image image;

  const ReminderCard({
    Key? key,
    required this.medication,
    required this.time,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: ColorsManager.white,
        child: ListTile(
          leading: image,
          title: medication,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4), // Added some spacing for better layout
              Row(
                children: [
                  const Icon(Icons.alarm, color: ColorsManager.blue, size: 20),
                  const SizedBox(
                      width: 4), // Added some spacing for better layout
                  Text(time),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward,
              color: ColorsManager.blue,
            ),
          ),
        ),
      ),
    );
  }
}
