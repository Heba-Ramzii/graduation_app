import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/more/more_screen.dart';
import 'package:graduation_app/feature/patient/layout/patient_more_screen.dart';
import 'package:graduation_app/feature/patient/layout/schedule_screen.dart';
import 'package:graduation_app/feature/patient/layout/search_patient_screen.dart';

import '../../doctor/pages/more/profile/patient_profile.dart';
import '../widget/appointment_card.dart';
import '../widget/reminder_card.dart';
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
    const SchedualScreen(),
    const PatientMoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 70,
            indicatorShape: const CircleBorder(
              eccentricity: 0.0,
            ),
            backgroundColor: ColorsManager.blue2,
            selectedIndex: currentIndex,
            indicatorColor: ColorsManager.white,
            onDestinationSelected: (Index) {
              setState(() {
                currentIndex = Index;
              });
            },
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/chat-alt.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  color: ColorsManager.blue,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/dots-horizontal.svg',
                  color: ColorsManager.blue,
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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200/300',
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Hello\'',
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorsManager.primaryLight,
                      ),
                    ),
                    Text(
                      'Jimmy Foley!',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsManager.font,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                iconSize: 30,
                color: ColorsManager.blue,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Stack(
            children: [
              SearchBar(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const SearchPatientSceen();
                    }),
                  );
                },
                backgroundColor:
                    const MaterialStatePropertyAll(ColorsManager.white),
                hintText: 'Search Doctor, Clinic',
                leading: const Icon(Icons.search, color: ColorsManager.blue),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Reminders',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Upcoming Appointment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
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
              ),
            ],
          ),
          SizedBox(
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
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Recommended Doctor',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
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
              ),
            ],
          ),
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}
