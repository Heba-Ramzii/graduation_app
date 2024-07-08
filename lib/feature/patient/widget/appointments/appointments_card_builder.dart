import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';


class AppointmentsCardBuilder extends StatelessWidget {
  const AppointmentsCardBuilder({super.key, required this.bookModel});
  final BookModel bookModel ;
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users').doc(bookModel.doctorId).
      collection('clinics').doc(bookModel.clinicId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          ClinicModel clinicModel = ClinicModel.fromJson(data);
          return Row(
            children: [
              ProfileImage(
                height: 91,
                width: 95,
                url: clinicModel.imagePath,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                clinicModel.name??'',
                                style: StyleManager.textStyle14.copyWith(
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Text(
                            clinicModel.price.toString(),
                            style: StyleManager.textStyle14mid.copyWith(
                              color: ColorsManager.primary,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                                IconlyBold.location,
                                size: 20,
                                color: ColorsManager.primary

                            ),
                            const SizedBox(width: 5,),
                            Text(
                              clinicModel.address?? '',
                              style: StyleManager.textStyle12.copyWith(
                                  color: ColorsManager.primaryLight
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('users').doc(bookModel.doctorId).
                        collection('appointments').doc(bookModel.appointmentId).get(),
                        builder:
                            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Something went wrong");
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const Text("Document does not exist");
                          }

                          if (snapshot.connectionState == ConnectionState.done) {
                            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                            AppointmentModel appointmentModel = AppointmentModel.fromJson(data);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${appointmentModel.dayName} ${bookModel.date!.toDate().day} / ${bookModel.date!.toDate().month}",
                                  style: StyleManager.textStyle12.copyWith(
                                      color: ColorsManager.primaryLight
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      IconlyLight.timeCircle,
                                      size: 16,
                                      color: ColorsManager.primary,
                                    ),
                                    const SizedBox(width: 5,),
                                    Text(
                                      "${appointmentModel.from!.timeOfDay}",
                                      style: StyleManager.textStyle14.copyWith(
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return const Text("loading");
      },
    );
  }
}

