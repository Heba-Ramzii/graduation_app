import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/appointment_card.dart';
import 'package:graduation_app/widget/reminder_card.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        ///   backgroundColor: ColorsManager.homePageBackground,
        bottomNavigationBar: NavigationBar(
          height: 70,
          indicatorShape: CircleBorder(
            eccentricity: 0.0,
          ),
          backgroundColor: ColorsManager.blue2,
          selectedIndex: 0,
          indicatorColor: ColorsManager.white,
          onDestinationSelected: (index) {},
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: ColorsManager.blue,
                ),
                label: ''),
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/chat-alt.svg',
                  color: ColorsManager.blue,
                ),
                label: ''),
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  color: ColorsManager.blue,
                ),
                label: ''),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/dots-horizontal.svg',
                color: ColorsManager.blue,
              ),
              label: '',
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200/300',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Hello\'',
                          style: TextStyle(
                              fontSize: 13, color: ColorsManager.primaryLight),
                        ),
                        const Text(
                          'Jimmy Foley!',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsManager.font,
                              fontWeight: FontWeight.bold),
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
                    backgroundColor:
                        MaterialStatePropertyAll(ColorsManager.white),
                    hintText: 'Search Doctor, Clinic',
                    leading: Icon(Icons.search, color: ColorsManager.blue),
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: const Text(
                      'Upcoming Appointment',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'view all',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.blue),
                        ),
                      )),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: const Text(
                      'Recommended Doctor',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'view all',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.blue),
                        ),
                      )),
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
        ),
      ),
    );
  }
}
