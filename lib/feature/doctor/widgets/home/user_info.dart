import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';

import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(12),
      decoration: StyleManager.containerDecoration,
      child:   FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(
            FirebaseAuth.instance.currentUser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          else if (snapshot.hasData && !snapshot.data!.exists) {
            goToFinish(context, const LoginScreen());
            return Text("Document does not exist");
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              children: [
                  ProfileImage(
                   height: 60,
                   width: 60,
                   size: 60,
                   url: data['image'],
                 ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: StyleManager.textStyle12.copyWith(
                            fontSize: 13,
                            color: ColorsManager.primaryLight
                        ),
                      ),
                      Text(
                        'Dr. ${data['name']}',
                        style:StyleManager.textStyle14mid ,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                      FontAwesomeIcons.bell
                  ),
                  color: ColorsManager.primary,
                ),
              ],
            );

          }
          else return Text("loading");
        },
      ),
    );
  }
}
