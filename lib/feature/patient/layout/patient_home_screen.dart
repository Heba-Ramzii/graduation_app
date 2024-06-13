import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/patient/layout/patient_more_screen.dart';
import 'package:graduation_app/feature/patient/layout/scedule/schedule_screen.dart';
import 'package:graduation_app/feature/patient/layout/search_patient_screen.dart';

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
            indicatorShape:  const CircleBorder(
                eccentricity: 0.2,
            ),
            backgroundColor: ColorsManager.blue2,
            selectedIndex: currentIndex,
            indicatorColor: ColorsManager.white,
            onDestinationSelected: (Index) {
              setState(() {
                currentIndex = Index;
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
            ]
        ),
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
              const ProfileImage(
                url:'https://picsum.photos/200/300',
                  height: 60,
                  width: 60,
                size: 60,
              ),
              const SizedBox(width: 10),
              const Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Hello,',
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
          SearchBar(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchPatientSceen();
                }),
              );
            },
            backgroundColor: const MaterialStatePropertyAll(ColorsManager.white),
            hintText: 'Search Doctor, Clinic',
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
