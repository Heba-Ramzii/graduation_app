import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme_manager/colors_manager.dart';

class PatientProfileScreen extends StatefulWidget {
   const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {

      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      print(formattedDate);
      setState(() {
        birthController.text = formattedDate;
      });
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final sexController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Profile'
      ),
      body:  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Stack(alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ProfileImage(
                        size: 90,
                        height: 100,
                        width: 100,
                      ),
                      InkWell(
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: ColorsManager.white,
                          child: Icon(
                            IconlyLight.edit,
                            size: 18,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                    ]),
              )),
          EditInfoRow(
            title: "Name",
            controller: nameController,
            inputType: TextInputType.name,
          ),
          EditInfoRow(
            title: "Email",
             controller: emailController,
            inputType: TextInputType.emailAddress,
          ),
          EditInfoRow(
            title: "Phone Number",
             controller: phoneController,
            inputType: TextInputType.phone,
          ),
          EditInfoRow(
            title: "Date of Birth",
             readOnly: true,
             controller: birthController,
            inputType: TextInputType.datetime,
            icon: IconlyLight.calendar,
            onTap: () {
              _selectDate(context);

              },
          ),
          const SizedBox(height: 40,),
          CustomMaterialButton(
              text: "Update profile",
              onPressed:  (){},
          ),
        ],
      ),
    ),
    );
  }
}
