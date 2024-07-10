import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/widgets/more/options_column.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';

import '../../../../core/theme_manager/style_manager.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  } else if (snapshot.hasData && !snapshot.data!.exists) {
                    goToFinish(context, const LoginScreen());
                    return const Text("Document does not exist");
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Column(
                      children: [
                        ProfileImage(
                          height: 100,
                          width: 100,
                          size: 100,
                          url: data['imagePath'],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: Text(
                            data['name'],
                            style: StyleManager.textStyle14.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Builder(builder: (context) {
                          if (data['adminVerified'] &&
                              GetDoctorCubit.get(context)
                                      .doctorModel!
                                      .adminVerified ==
                                  false) {
                            GetDoctorCubit.get(context).getDoctor();
                          }
                          if (data['adminVerified']) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 20.0),
                              child: Text(
                                'You are verified',
                                style: StyleManager.textStyle14.copyWith(
                                    color: ColorsManager.primary,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 20.0),
                              child: Text(
                                'You are not verified yet',
                                style: StyleManager.textStyle14.copyWith(
                                    color: ColorsManager.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }
                        })
                      ],
                    );
                  }
                  return const SizedBox();
                }),
            const OptionsColumn(),
          ],
        ),
      ),
    );
  }
}
