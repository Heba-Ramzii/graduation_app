import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/ai_diagnosis/upload_process.dart';

import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/theme_manager/style_manager.dart';

class FileList extends StatelessWidget {
  const FileList({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0,bottom: 20),
          child: Text(
            "Files",
            style: StyleManager.textStyle14.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const UploadProcess(),
            itemCount: 3,
            separatorBuilder: ( context,  index) => const SizedBox(height: 20,),
          ),
        ),
         CustomMaterialButton(
          text: "Confirm",
          onPressed: () {},
        ),
      ],
      ),
    );
  }
}
