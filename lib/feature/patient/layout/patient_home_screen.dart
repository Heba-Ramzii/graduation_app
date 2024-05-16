import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/navigation_bar.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/layout/chat_screen.dart';
import 'package:graduation_app/layout/patient_profile_screen.dart';
import 'package:graduation_app/layout/schedule_screen.dart';
import 'package:graduation_app/layout/search_patient_screen.dart';
import 'package:graduation_app/widget/appointment_card.dart';
import 'package:graduation_app/widget/reminder_card.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  int currentIndex = 0;

  List<Widget> screens = [
    PatientHomeScreen(),
    ChatScreen(),
    SchedualScreen(),
    PatientProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 70,
            indicatorShape: CircleBorder(
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
          SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200/300',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
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
                icon: Icon(Icons.notifications_none),
              ),
            ],
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              SearchBar(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return SearchPatientSceen();
                    }),
                  );
                },
                backgroundColor: MaterialStatePropertyAll(ColorsManager.white),
                hintText: 'Search Doctor, Clinic',
                leading: Icon(Icons.search, color: ColorsManager.blue),
              ),
            ],
          ),
          SizedBox(height: 24),
          Text(
            'Reminders',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ReminderCard(
            medication: Text(
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
          SizedBox(height: 10),
          ReminderCard(
            medication: Text(
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
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
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
                  child: Text(
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
          Container(
            height: 150,
            width: double.infinity,
            child: CarouselSlider(
              items: [
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
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
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
                  child: Text(
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
          Container(
            height: 150,
            width: double.infinity,
            child: CarouselSlider(
              items: [
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
