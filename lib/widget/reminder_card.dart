import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class ReminderCard extends StatelessWidget {
  final Widget medication;
  final String time;
  final Image image;

  const ReminderCard(
      {super.key,
      required this.medication,
      required this.time,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('data aaa'),
              Row(
                children: [
                  const Icon(Icons.alarm, color: ColorsManager.blue),
                  Text(' $time'),
                ],
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: ColorsManager.blue,
              )),
        ),
      ),
    );
  }
}
