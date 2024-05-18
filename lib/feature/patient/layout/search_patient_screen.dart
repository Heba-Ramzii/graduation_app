import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button_fillter.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

import '../widget/book_card.dart';

class SearchPatientSceen extends StatefulWidget {
  const SearchPatientSceen({super.key});

  @override
  _SearchPatientSceenState createState() => _SearchPatientSceenState();
}

class _SearchPatientSceenState extends State<SearchPatientSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ColorsManager.primaryLight3,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        actions: [
          SizedBox(
            child: Container(
              width: 380,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchBar(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                 hintText: 'Search Doctor, Clinic',
                leading: const Icon(Icons.search, color: ColorsManager.blue),
                trailing: Iterable<Widget>.generate(
                  1,
                      (index) => SvgPicture.asset(
                    'assets/icons/adjustments.svg',
                    color: ColorsManager.blue,
                    width: 24,
                    height: 24,
                  ),
                ).toList(),
              ),
            ),
          ),

        ],
      ),
      backgroundColor: ColorsManager.homePageBackground,
      bottomNavigationBar: NavigationBar(
        height: 70,
        indicatorShape: const CircleBorder(
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
              width: 24, // Adjusted icon size
              height: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/chat-alt.svg',
              color: ColorsManager.blue,
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              color: ColorsManager.blue,
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/dots-horizontal.svg',
              color: ColorsManager.blue,
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (int i = 0; i < 5; i++) ...[
                  CustomFillterButton(
                    text: 'Filter',
                    onPressed: () {},
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 4; i++) ...[
              SizedBox(
                height: 200,
                width:
                    MediaQuery.of(context).size.width * 0.9, // Adjusted width
                child: const BookCard(
                ),
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}
