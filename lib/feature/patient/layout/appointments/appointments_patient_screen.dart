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
                  .collection('patientsBooks')
                  .where('patientId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots()
                  :
              FirebaseFirestore.instance
                  .collection('patientsBooks')
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
                        List<PatientBookModel> patientBookModels =
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          return PatientBookModel.fromJson(data);
                        }).toList();
                        print('patientBookModels[index].bookId ${patientBookModels[index].bookId}');

                      return  FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('clinicBooks')
                          .doc(patientBookModels[index].bookId)
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
                              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                              BookModel bookModel = BookModel.fromJson(data);
                              switch(selectedIndex) {
                                case 0:
                                  return AllAppointments(bookModel: bookModel,
                                    patientBookModel: patientBookModels[index],
                                  );
                                case 1:
                                  return UpcomingAppointment(
                                      patientBookModel: patientBookModels[index],
                                      bookModel:bookModel
                                  );
                                case 2:
                                  return CompletedAppointment(bookModel: bookModel);
                                case 3:
                                  return CancelledAppointment(bookModel: bookModel);
                              }
                            }

                            return Text("loading");
                          },
                        );

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
