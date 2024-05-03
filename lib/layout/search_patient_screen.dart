import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button_fillter.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/book_card.dart';

class SearchPatientSceen extends StatefulWidget {
  const SearchPatientSceen({super.key});

  @override
  _SearchPatientSceenState createState() => _SearchPatientSceenState();
}

class _SearchPatientSceenState extends State<SearchPatientSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 16),
            Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorsManager.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 20),
                  child: SearchBar(
                    shadowColor: MaterialStatePropertyAll(ColorsManager.white),
                    shape: MaterialStatePropertyAll(LinearBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(ColorsManager.white),
                    hintText: 'Search Doctor, Clinic',
                    leading: Icon(Icons.search, color: ColorsManager.blue),
                    trailing: Iterable<Widget>.generate(
                      1,
                      (index) => SvgPicture.asset(
                        'assets/icons/adjustments.svg',
                        color: ColorsManager.blue,
                      ),
                    ).toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomFillterButton(
                  text: 'filter',
                  onPressed: () {},
                ),
                Spacer(
                  flex: 1,
                ),
                CustomFillterButton(
                  text: 'filter',
                  onPressed: () {},
                ),
                Spacer(
                  flex: 1,
                ),
                CustomFillterButton(
                  text: 'filter',
                  onPressed: () {},
                ),
                Spacer(
                  flex: 1,
                ),
                CustomFillterButton(
                  text: 'filter',
                  onPressed: () {},
                ),
                Spacer(
                  flex: 1,
                ),
                CustomFillterButton(
                  text: 'filter',
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: BookCard(
                doctorName: 'Dr. James Hilar',
                department: 'Respiratory',
                price: "150",
                rating: 4.2,
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: BookCard(
                doctorName: 'Dr. James Hilar',
                department: 'Respiratory',
                price: "150",
                rating: 4.2,
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: BookCard(
                doctorName: 'Dr. James Hilar',
                department: 'Respiratory',
                price: "150",
                rating: 4.2,
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: BookCard(
                doctorName: 'Dr. James Hilar',
                department: 'Respiratory',
                price: "150",
                rating: 4.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
