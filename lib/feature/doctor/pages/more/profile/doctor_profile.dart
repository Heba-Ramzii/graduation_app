import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';
import '../../../../../core/theme_manager/colors_manager.dart';

class DoctorProfileScreen extends StatelessWidget {
   DoctorProfileScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final sexController = TextEditingController();
  final specialityController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Info'
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
              title: "Speciality",
               controller: specialityController,
              inputType: TextInputType.datetime,
               onTap: () {},
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
