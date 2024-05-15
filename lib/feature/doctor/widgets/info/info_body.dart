import 'package:flutter/material.dart';

import '../profile/edit_info_row.dart';


class InfoBody extends StatelessWidget {
   InfoBody({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ssnController = TextEditingController();
  final specialityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          readOnly: true,
          title: "Speciality",
          controller: specialityController,
          inputType: TextInputType.datetime,
          onTap: () {},
          icon: Icons.keyboard_arrow_down_rounded,
        ),
        EditInfoRow(
          title: "SSN",
          controller: ssnController,
          inputType: TextInputType.phone,
        ),

      ],
    );
  }
}
