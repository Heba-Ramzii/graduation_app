import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/widget/appointments/reason_section.dart';


class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  var _val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Review"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ProfileImage(height: 100, width: 100,size: 100,),
            ),
            Text("Jimmy Fallon",
                style: StyleManager.mainTextStyle15.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          '5 Stars',
                          style: StyleManager.mainTextStyle15.copyWith(
                              color: ColorsManager.primaryLight
                          )
                      ),
                      selectedTileColor:ColorsManager.primary ,
                      value: 5,
                      groupValue: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      }),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title:  Text('4 Stars',
                          style: StyleManager.mainTextStyle15.copyWith(
                              color: ColorsManager.primaryLight
                          )),
                      value: 4,
                      groupValue: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      }),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          '3 Stars',style: StyleManager.mainTextStyle15.copyWith(
                          color: ColorsManager.primaryLight
                      )),
                      value: 3,
                      groupValue: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      }),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('2 Stars',
                          style: StyleManager.mainTextStyle15.copyWith(
                              color: ColorsManager.primaryLight
                          )),
                      value: 2,
                      groupValue: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      }),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title:  Text('1 Star',
                          style: StyleManager.mainTextStyle15.copyWith(
                              color: ColorsManager.primaryLight
                          )),
                      value: 1,
                      groupValue: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      }),
                ],
              ),
            ),
            const ReasonSection(title: "You can write a comment",),
          ],
        ),
      ),
    );
  }
}
