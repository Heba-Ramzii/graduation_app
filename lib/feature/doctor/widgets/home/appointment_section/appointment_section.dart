import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/pages/appointment/appointment_screen.dart';
import 'package:graduation_app/feature/patient/data/repo/patient_repo/patient_repo_imp.dart';

import '../../../../../core/theme_manager/style_manager.dart';

class AppointmentSection extends StatelessWidget {
  const AppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today Appointment',
          style: StyleManager.mainTextStyle15
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('appointments')
              .where(
                'day',
                isEqualTo: DateTime.now().weekday,
              )
              .orderBy('from')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No Appointments Today !'),
              );
            } else {
              return SizedBox(
                height: 130,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = snapshot.data!.docs[index]
                        .data()! as Map<String, dynamic>;
                    AppointmentModel appointmentModel =
                        AppointmentModel.fromJson(data);

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('clinics')
                          .doc(data['clinicId'])
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        } else if (snapshot.hasData && !snapshot.data!.exists) {
                          return Text("Document does not exist");
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          Map<String, dynamic> clinicData =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return InkWell(
                            child: SizedBox(
                              child: Container(
                                width: 270,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: StyleManager.containerDecoration,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ProfileImage(
                                              height: 60,
                                              width: 60,
                                              url: clinicData['imagePath'],
                                            ),
                                            SizedBox(
                                              height: 60,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 18.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${clinicData['name']}',
                                                      style: StyleManager
                                                          .textStyle14mid,
                                                    ),
                                                    Text(
                                                      '${clinicData['address']}',
                                                      style: StyleManager
                                                          .textStyle12
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorsManager
                                                                  .primaryLight),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            FontAwesomeIcons.calendarMinus,
                                            size: 20,
                                            color: ColorsManager.primary,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${data['fromTime']} : ${data['toTime']}',
                                          style: StyleManager.textStyle12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppointmentScreen(
                                          appointmentModel: appointmentModel,
                                          data: data,
                                          clincData: clinicData)));
                            },
                          );
                        } else
                          return Text("loading");
                      },
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 30,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
