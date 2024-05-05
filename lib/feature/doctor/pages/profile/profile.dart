import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/doctor/widgets/more/options_column.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final sexController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Profile',
          style: StyleManager.mainTextStyle15.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
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
            title: "Password",
             controller: passController,
            inputType: TextInputType.visiblePassword,
           ),
          EditInfoRow(
            title: "Phone Number",
             controller: phoneController,
            inputType: TextInputType.phone,
          ),
          EditInfoRow(
            title: "Date of Birth",
             controller: birthController,
            inputType: TextInputType.datetime,
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
