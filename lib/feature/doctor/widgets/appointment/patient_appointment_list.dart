import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/widgets/appointment/paient_list_builder.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';
import '../../pages/patient_details/patient_details_screen.dart';

class PatientAppointmentList extends StatelessWidget {
  const PatientAppointmentList(
      {super.key, required this.clinicModel, required this.appointmentModel});
  final ClinicModel clinicModel;
  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      String id =
          '${getNextDayTime(DateTime.now().weekday, '${appointmentModel.from!.dateTime!.toDate().hour}'
              ':'
              '${appointmentModel.from!.dateTime!.toDate().minute}').toString()}${FirebaseAuth.instance.currentUser!.uid}';
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('patientsBooks')
            .where('bookId', isEqualTo: id)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> patientsBooksSnapshot) {
          if (patientsBooksSnapshot.hasError) {
            return Text('Something went wrong');
          }

          if (patientsBooksSnapshot.connectionState ==
              ConnectionState.waiting) {
            return Text("Loading");
          }

          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Patients',
                      style: StyleManager.textStyle14,
                    ),
                    const Spacer(),
                    Text(
                      '${patientsBooksSnapshot.data!.docs.length}',
                      style: StyleManager.textStyle12.copyWith(
                        fontSize: 13,
                        color: ColorsManager.primaryLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      child: PatientListBuilder(
                        patientBookModel: PatientBookModel.fromJson(
                            patientsBooksSnapshot.data!.docs[index].data()
                                as Map<String, dynamic>),
                        index: index,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientDetailsScreen(
                                    index: index,
                                    patientBookModel: PatientBookModel.fromJson(
                                        patientsBooksSnapshot.data!.docs[index]
                                            .data() as Map<String, dynamic>),
                                  )),
                        );
                      },
                    ),
                    itemCount: patientsBooksSnapshot.data!.docs.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  DateTime getNextDayTime(int day, String time) {
    // Create a map of days to integers

    // Parse the time
    TimeOfDay parsedTime = TimeOfDay(
      hour: int.parse(time.split(':')[0]),
      minute: int.parse(time.split(':')[1]),
    );

    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the next occurrence of the specified day
    int targetDay = day;
    int daysUntilNextTargetDay = (targetDay - now.weekday + 7) % 7;
    /*  if (daysUntilNextTargetDay == 0 &&
        (now.hour > parsedTime.hour ||
            (now.hour == parsedTime.hour && now.minute >= parsedTime.minute))) {
      daysUntilNextTargetDay = 7;
    } */

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
}
