import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button_fillter.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/widget/book_card.dart';

class SearchPatientSceen extends StatefulWidget {
  const SearchPatientSceen({Key? key});

  @override
  _SearchPatientSceenState createState() => _SearchPatientSceenState();
}

class _SearchPatientSceenState extends State<SearchPatientSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
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
        padding: EdgeInsets.all(16.0),
        child: Column(
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
                    size: 24, // Adjusted icon size
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
                        width: 24,
                        height: 24,
                      ),
                    ).toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++) ...[
                  CustomFillterButton(
                    text: 'Filter',
                    onPressed: () {},
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ],
            ),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 4; i++) ...[
              SizedBox(
                height: 200,
                width:
                    MediaQuery.of(context).size.width * 0.9, // Adjusted width
                child: BookCard(
                  doctorName: 'Dr. James Hilar',
                  department: 'Respiratory',
                  price: "150",
                  rating: 4.2,
                ),
              ),
              SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}
