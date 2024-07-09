import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/layout/scedule/schedule_screen.dart';
import 'package:graduation_app/feature/patient/widget/scedule/details.dart';

import '../../../core/theme_manager/style_manager.dart';

class AppointmentCard extends StatelessWidget {
  final BookModel bookModel;
  final PatientBookModel patientBookModel;

  const AppointmentCard({
    Key? key,
    required this.bookModel,
    required this.patientBookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(bookModel.doctorId)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          DoctorModel doctorModel = DoctorModel.fromJson(data);
          return InkWell(
            onTap: () {
              goTo(
                context,
                DetailsScreen(
                    bookModel: bookModel, patientBookModel: patientBookModel),
              );
            },
            child: Container(
              //height: 130,
              width: 240,
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              padding: const EdgeInsets.all(12.0),
              decoration: StyleManager.containerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImage(
                      url: doctorModel.imagePath, height: 70, width: 70),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorModel.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          doctorModel.speciality ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsManager.font,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          bookModel.dateToShow ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsManager.grayFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}

class RecommandedDoctorCard extends StatelessWidget {
  final DoctorModel doctorModel;

  const RecommandedDoctorCard({
    Key? key,
    required this.doctorModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goTo(
          context,
          ScheduleScreen(doctorModel: doctorModel),
        );
      },
      child: Container(
        //height: 130,
        width: 270,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        padding: const EdgeInsets.all(12.0),
        decoration: StyleManager.containerDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImage(url: doctorModel.imagePath, height: 100, width: 80),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorModel.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              doctorModel.speciality ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                color: ColorsManager.font,
                              ),
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
                  const SizedBox(height: 10),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: doctorModel.rate !=null? doctorModel.rate!.toDouble(): 0.0,
                    itemSize: 25,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    
    
    /* const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.alarm, color: ColorsManager.blue),
                    const SizedBox(width: 4),
                    Text(time),
                  ],
                ), */
                   