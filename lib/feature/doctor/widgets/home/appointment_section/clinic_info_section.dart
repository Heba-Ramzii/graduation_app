import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core_widgets/profile_image.dart';
import '../../../../../core/theme_manager/colors_manager.dart';
import '../../../../../core/theme_manager/style_manager.dart';

class ClinicInfoSection extends StatelessWidget {
  const ClinicInfoSection({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('clinics')
          .doc(data['clinicId'])
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        } else if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        } else if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> clinicData =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   ProfileImage(
                    height: 60,
                    width: 60,
                    url: clinicData['imagePath'],
                  ),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${clinicData['name']}',
                            style: StyleManager.textStyle14mid,
                          ),
                          Text(
                            '${clinicData['address']}',
                            style: StyleManager.textStyle12.copyWith(
                                fontSize: 13,
                                color: ColorsManager.primaryLight),
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
            ],
          );
        } else
          return Text("loading");
      },
    );
  }
}
