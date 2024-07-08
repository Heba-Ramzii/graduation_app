import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class TimeColumn extends StatefulWidget {
  const TimeColumn({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;

  @override
  State<TimeColumn> createState() => _TimeColumnState();
}

class _TimeColumnState extends State<TimeColumn> {
  DateTime getNextDayTime(String day, String time) {
    // Create a map of days to integers
    Map<String, int> dayMap = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7
    };

    // Parse the time
    TimeOfDay parsedTime = TimeOfDay(
      hour: int.parse(time.split(':')[0]),
      minute: int.parse(time.split(':')[1]),
    );

    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the next occurrence of the specified day
    int targetDay = dayMap[day]!;
    int daysUntilNextTargetDay = (targetDay - now.weekday + 7) % 7;
    if (daysUntilNextTargetDay == 0 && (now.hour > parsedTime.hour || (now.hour == parsedTime.hour && now.minute >= parsedTime.minute))) {
      daysUntilNextTargetDay = 7;
    }

    // Calculate the next date for the specified day and time
    DateTime nextDayTime = DateTime(
      now.year,
      now.month,
      now.day + daysUntilNextTargetDay,
      parsedTime.hour,
      parsedTime.minute,
    );

    return nextDayTime;
  }
  late DateTime nextDayTime;
  @override
  void initState() {
    super.initState();
    nextDayTime =
    getNextDayTime(widget.appointmentModel.dayName!,
        '${widget.appointmentModel.from!.dateTime!.toDate().hour}:${widget.appointmentModel.from!.dateTime!.toDate().minute}');

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0,top: 32),
          child: Divider(
            color: ColorsManager.primary,
            thickness: 1,
          ),
        ),

        Builder(builder: (context) {
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${nextDayTime.day} - ${nextDayTime.month} - ${nextDayTime.year}",
                style: StyleManager.textStyle14.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
              const SizedBox(height: 16,),
              Text(
                "${widget.appointmentModel.dayName} ${widget.appointmentModel.from!.timeOfDay} ",
                style: StyleManager.textStyle14.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ],
          );
        }),

        const Padding(
          padding: EdgeInsets.only(bottom: 16.0,top: 32),
          child: Divider(
            color: ColorsManager.primary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
