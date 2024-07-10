import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_state.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';
import 'package:graduation_app/feature/patient/layout/patient_more_screen.dart';
import 'package:graduation_app/feature/patient/layout/search_patient_screen.dart';

import '../widget/appointment_card.dart';
import '../widget/reminder_card.dart';
import 'appointments/appointments_patient_screen.dart';
import 'chat_screen.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  int currentIndex = 0;

  List<Widget> screens = [
    const PatientHomeScreen(),
    const ChatScreen(),
    const AppointmentsPatientScreen(),
    const PatientMoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 70,
            indicatorShape: const CircleBorder(
              eccentricity: 0.2,
            ),
            backgroundColor: ColorsManager.blue2,
            selectedIndex: currentIndex,
            indicatorColor: ColorsManager.white,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  IconlyLight.home,
                  color: ColorsManager.blue,
                  size: 24,
                ),
                selectedIcon: Icon(
                  IconlyBold.home,
                  color: ColorsManager.primary,
                  size: 24,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  IconlyLight.chat,
                  color: ColorsManager.blue,
                ),
                selectedIcon: Icon(
                  IconlyBold.chat,
                  color: ColorsManager.primary,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  IconlyLight.calendar,
                  color: ColorsManager.blue,
                  size: 24,
                ),
                selectedIcon: Icon(
                  IconlyBold.calendar,
                  color: ColorsManager.primary,
                  size: 24,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: ColorsManager.blue,
                  size: 24,
                ),
                selectedIcon: Icon(
                  Icons.more_horiz_rounded,
                  color: ColorsManager.primary,
                  size: 24,
                ),
                label: '',
              ),
            ]),
        body: screens[currentIndex],
      ),
    );
  }
}

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              BlocConsumer<GetPatientCubit, GetPatientState>(
                listener: (context, state) {
                  if (state is GetPatientFailure) {
                    callMyToast(
                        massage: state.failure.message,
                        state: ToastState.ERROR);
                    goToFinish(context, const LoginScreen());
                  }
                },
                builder: (context, state) {
                  if (state is GetPatientSuccess) {
                    return Expanded(
                      child: Row(
                        children: [
                          ProfileImage(
                            url: state.patientModel.imagePath,
                            height: 60,
                            width: 60,
                            size: 60,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  ' Hello,',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorsManager.primaryLight,
                                  ),
                                ),
                                Text(
                                  state.patientModel.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: ColorsManager.font,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              goTo(context, const SearchPatientSceen());
            },
            child: SizedBox(
              height: 60,
              child: Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 5,
                child: TextFormField(
                  enabled: false,
                  onTap: () {
                    goTo(context, const SearchPatientSceen());
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Doctor',
                    hintStyle: const TextStyle(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    filled: true,
                    fillColor: ColorsManager.blue2,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: ColorsManager.primary,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /*SearchBar(
            controller: controller,
            onTap: () {
              goTo(context, const SearchPatientSceen());
            },
            backgroundColor:
                const MaterialStatePropertyAll(ColorsManager.white),
            hintText: 'Search Doctor',
            leading: const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.search_rounded,
                  color: ColorsManager.primary,
                  size: 30,
                ),
              ),
            ),
          ),
           const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Reminders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ReminderCard(
            medication: const Text(
              'Paracetamol',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorsManager.font,
              ),
            ),
            time: '8:45 AM',
            image: Image.asset(
              'assets/icons/Reminder.png',
            ),
          ),
          const SizedBox(height: 10),
          ReminderCard(
            medication: const Text(
              'test',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorsManager.font,
              ),
            ),
            time: '11:45 AM',
            image: Image.asset(
              'assets/icons/Reminder.png',
            ),
          ),
          */
          const SizedBox(height: 30),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Upcoming Appointment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              /*  Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'view all',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.blue,
                    ),
                  ),
                ),
              ), */
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('patientsBooks')
                .where('patientId',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .where('status', isEqualTo: 1)
                .orderBy('bookId', descending: false)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> patientBookSnapshot) {
              if (patientBookSnapshot.hasError) {
                return Text('Something went wrong');
              }

              if (patientBookSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Text("Loading");
              }

              if (patientBookSnapshot.data != null) {
                if (patientBookSnapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No upcoming appointment yet !'),
                  );
                } else {
                  return SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: patientBookSnapshot.data!.docs
                          .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        PatientBookModel patientBookModel =
                            PatientBookModel.fromJson(data);
                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('clinicBooks')
                              .doc(patientBookModel.bookId)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Something went wrong");
                            }

                            if (snapshot.hasData && !snapshot.data!.exists) {
                              return Text("Document does not exist");
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              Map<String, dynamic> data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              BookModel bookModel = BookModel.fromJson(data);
                              return AppointmentCard(
                                bookModel: bookModel,
                                patientBookModel: patientBookModel,
                              );
                            }
                            return Text("loading");
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),

          /*  SizedBox(
            height: 150,
            width: double.infinity,
            child: CarouselSlider(
              items: const [
                AppointmentCard(
                  doctorName: 'Dr. James Hilar',
                  department: 'Respiratory',
                  time: '16:00 - 22:00',
                  rating: 4.2,
                ),
                AppointmentCard(
                  doctorName: 'Dr. ahmed Hilar',
                  department: 'Respiratory',
                  time: '16:00 - 22:00',
                  rating: 4.2,
                ),
              ],
              options: CarouselOptions(autoPlay: true),
            ),
          ),
          */
          const SizedBox(height: 20),
          const Text(
            'Recommended Doctor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('isDoctor', isEqualTo: true)
                  .where('rate', isGreaterThan: 2)
                  .orderBy('rate', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.data != null) {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('There is no doctor available'),
                    );
                  } else {
                    return CarouselSlider(
                      options:
                          CarouselOptions(autoPlay: true, aspectRatio: 2.5),
                      items: List.generate(snapshot.data!.docs.length, (index) {
                        Map<String, dynamic> data = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return BlocConsumer<GetPatientCubit, GetPatientState>(
                          listener: (context, state) {
                            if (state is GetPatientFailure) {
                              goToFinish(context, const LoginScreen());
                            }
                          },
                          builder: (context, state) {
                            if (state is GetPatientSuccess) {
                              return DoctorCard(
                                  doctorModel: DoctorModel.fromJson(data),
                                  favoriteDoctors: GetPatientCubit.get(context)
                                      .patientModel!
                                      .favoriteDoctors);
                            } else if (state is GetPatientLoading) {
                              return const DefaultLoading();
                            }
                            return const SizedBox();
                          },
                        );
                        //return RecommandedDoctorCard(doctorModel: DoctorModel.fromJson(data));
                      }),
                    );
                  }
                }
                return const SizedBox();
              }),
          /*   SizedBox(
            height: 150,
            width: double.infinity,
            child: CarouselSlider(
              items: const [
                AppointmentCard(
                  doctorName: 'Dr. James Hilar',
                  department: 'Respiratory',
                  time: '16:00 - 22:00',
                  rating: 4.2,
                ),
                AppointmentCard(
                  doctorName: 'Dr. ahmed Hilar',
                  department: 'Respiratory',
                  time: '16:00 - 22:00',
                  rating: 4.2,
                ),
              ],
              options: CarouselOptions(),
            ),
          ), */
        ],
      ),
    );
  }
}
