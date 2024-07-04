import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/widgets/doctor_clinics/clinics/clinics_item_builder.dart';

class ClinicsList extends StatelessWidget {
  const ClinicsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
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
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ClinicsItemBuilder(
                      clinicModel: ClinicModel.fromJson(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>));
                },
                itemCount: snapshot.data!.docs.length,
              ),
            );
          }
        });
  }
}
