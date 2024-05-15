import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class ClinicCad extends StatelessWidget {
  final String doctorName;
  final String adddress;
  final String time;

  const ClinicCad({
    super.key,
    required this.doctorName,
    required this.adddress,
    required this.time,
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
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      subtitle: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(adddress),
            const SizedBox(
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
      trailing: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "12 patient",
            style: TextStyle(
              color: ColorsManager.blue,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ));
  }
}
