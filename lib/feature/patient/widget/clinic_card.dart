import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/doctor/pages/appointment/appointment_screen.dart';
import 'package:graduation_app/feature/patient/layout/scedule/continue_schedule.dart';

class ClinicCard extends StatelessWidget {
  final DoctorModel doctorModel;
  const ClinicCard({
    super.key,
    required this.doctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(doctorModel.id)
            .collection('clinics')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              height: 170,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ClinicModel clinicModel = ClinicModel.fromJson(
                      snapshot.data!.docs[index].data()
                          as Map<String, dynamic>);
                  return PatientClinicCardItemBuilder(
                    clinicModel: clinicModel,
                    doctorModel: doctorModel,
                  );
                },
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16,
                ),
              ),
            );
          }
        });
  }
}
class ClinicCardItemBuilder extends StatelessWidget
{
  final ClinicModel clinicModel;
  final DoctorModel doctorModel;
  const ClinicCardItemBuilder({
    super.key,
    required this.clinicModel,
    required this.doctorModel,
  });
  @override
  Widget build(BuildContext context) {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileImage(
                    height: 60,
                    width: 60,
                    url: clinicModel.imagePath,
                  ),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            clinicModel.name ?? '',
                            style: StyleManager.textStyle14mid,
                          ),
                          Text(
                            clinicModel.address ?? '',
                            style: StyleManager.textStyle12
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
              Text(
                '12 Patients',
                style: StyleManager.textStyle12.copyWith(
                  fontSize: 13,
                  color: ColorsManager.primaryLight,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const Text(
                    "16:00 - 22:00",
                    style: StyleManager.textStyle12,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        goTo(
            context,
            AppointmentScreen(
              clincData: clinicModel.toJson(),
              data: doctorModel.toJson(),
            ));
      },
    );
  }
}

class PatientClinicCardItemBuilder extends StatelessWidget {
  final ClinicModel clinicModel;
  final DoctorModel doctorModel;
  const PatientClinicCardItemBuilder({
    super.key,
    required this.clinicModel,
    required this.doctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 270,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: StyleManager.containerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileImage(
                  height: 80,
                  width: 80,
                  url: clinicModel.imagePath,
                ),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:[
                            Text(
                              clinicModel.name ?? '',
                              style: StyleManager.textStyle14mid,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 50.0,
                                end: 10.0,
                              ),
                              child: Text(
                              '${clinicModel.price.toString()}.LE',
                               style: StyleManager.textStyle14mid.copyWith(
                               color: ColorsManager.primary,
                                 ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          clinicModel.address ?? '',
                          style: StyleManager.textStyle12
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
            // Text(
            //   '12 Patients',
            //   style: StyleManager.textStyle12.copyWith(
            //     fontSize: 13,
            //     color: ColorsManager.primaryLight,
            //   ),
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: () {},
            //       child: const Icon(
            //         FontAwesomeIcons.calendarMinus,
            //         size: 20,
            //         color: ColorsManager.primary,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     const Text(
            //       "16:00 - 22:00",
            //       style: StyleManager.textStyle12,
            //     )
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),
            CustomMaterialButton(
              text: "Book",
              onPressed: () {
                goTo(context, const ContinueScheduleScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}


