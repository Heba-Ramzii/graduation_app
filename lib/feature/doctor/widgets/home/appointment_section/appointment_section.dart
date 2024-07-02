import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/pages/appointment/appointment_screen.dart';
import 'package:graduation_app/feature/doctor/widgets/home/appointment_section/appointment_list_builder.dart';

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
              .collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('appointments').where(
            'day', isEqualTo: DateTime.now().day,
          ).orderBy('from').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            if(snapshot.data!.docs.isEmpty){
              return const Center(
                  child: Text('No Appointments Today !'),
              );
            }
            else {
              return SizedBox(
                height:130,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)
                  {
                    Map<String, dynamic> data = snapshot.data!.docs[index].data()! as Map<String, dynamic>;
                    return InkWell(
                      child: AppointmentListBuilder(data: data),
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const AppointmentScreen()));
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
