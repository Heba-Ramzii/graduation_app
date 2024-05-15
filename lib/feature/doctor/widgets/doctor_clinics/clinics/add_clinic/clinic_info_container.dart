import 'package:flutter/material.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import '../../../../../../core/core_widgets/profile_image.dart';
import '../../../../../../core/theme_manager/colors_manager.dart';
import '../../../profile/edit_info_row.dart';

class ClinicInfoContainer extends StatelessWidget {
   ClinicInfoContainer({super.key});
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius:StyleManager.borderRadius,
      ),
      child: Center(
        child: Column(
          children: [
            const ProfileImage(
              size: 90,
              height: 100,
              width: 100,
            ),
            CustomTextButton(
              text: "Change Photo",
              onPressed:(){},
              fontWeight: FontWeight.bold,
            ),
            EditInfoRow(
              title: "Name",
              controller: nameController,
              inputType: TextInputType.name,
            ),
            EditInfoRow(
              title: "Phone",
              controller: phoneController,
              inputType: TextInputType.phone,
            ),
            EditInfoRow(
              title: "Address",
              controller: addressController,
              inputType: TextInputType.streetAddress,
            ),
            EditInfoRow(
              title: "Description",
              controller: descriptionController,
              inputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
