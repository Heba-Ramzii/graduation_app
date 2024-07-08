import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/filter_row.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/widget/appointments/all_appointments.dart';
import 'package:graduation_app/feature/patient/widget/appointments/cancelled_appointment.dart';
import 'package:graduation_app/feature/patient/widget/appointments/completed_appointment.dart';
import 'package:graduation_app/feature/patient/widget/appointments/upcoming_appointment.dart';

class AppointmentsPatientScreen extends StatefulWidget {
  const AppointmentsPatientScreen({super.key});

  @override
  State<AppointmentsPatientScreen> createState() =>
      _AppointmentsPatientScreenState();
}

class _AppointmentsPatientScreenState extends State<AppointmentsPatientScreen> {
  int selectedIndex = 0;

  final List<String> filter = [
    'All',
    'Upcoming',
    'Completed',
    'Cancelled',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Appointments",
        actionIcon: IconlyLight.filter,
        //actionTap: (),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterRow(
              filters: filter,
              onSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: selectedIndex== 0
                  ? FirebaseFirestore.instance
                  .collection('books')
                  .where('patientId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots()
                  :
              FirebaseFirestore.instance
                  .collection('books')
                  .where('patientId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where('status', isEqualTo: selectedIndex )
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                if(!snapshot.hasData){
                  return const Center(child: Text("No Appointments"),);
                }
                if(snapshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index)
                      {
                        List<BookModel> bookModels =
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          return BookModel.fromJson(data);
                        }).toList();
                        switch(selectedIndex) {
                          case 0:
                            return AllAppointments(bookModel: bookModels[index]);
                          case 1:
                            return UpcomingAppointment(bookModel: bookModels[index]);
                          case 2:
                            return CompletedAppointment(bookModel: bookModels[index]);
                          case 3:
                            return CancelledAppointment(bookModel: bookModels[index]);
                        }
                        return null;
                      },
                      itemCount:  snapshot.data!.docs.length,
                    ),
                  );
                }



                return const SizedBox();
              },
            ),

          ],
        ),
      ),
    );
  }
}
