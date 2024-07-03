import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/cubit/ai_diagnosis_cubit.dart';
import 'package:graduation_app/generated/assets.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class UploadImageContainer extends StatelessWidget {
  const UploadImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
          border: DashedBorder.fromBorderSide(
              dashLength: 15,
              side: BorderSide(color: ColorsManager.primaryBorder, width: 2)),
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: BlocBuilder<AiDiagnosisCubit, AiDiagnosisState>(
        builder: (context, state) {
          var cubit = AiDiagnosisCubit.get(context);
          return cubit.image != null
              ? Column(
                  children: [
                    Image.file(
                      cubit.image!,
                      height: 150,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomMaterialButton(
                      text: "Confirm",
                      onPressed: () {
                        // cubit.aiDiagnosis(doctorId: 1);
                      },
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 15),
                      child: Image.asset(
                        Assets.imagesUploadCloud,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Text(
                      "Drag or drop file here",
                      style: StyleManager.buttonTextStyle16.copyWith(
                        color: ColorsManager.primaryLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 21.0),
                      child: Text(
                        "-OR-",
                        style: StyleManager.buttonTextStyle16.copyWith(
                          color: ColorsManager.primaryLight,
                        ),
                      ),
                    ),
                    CustomMaterialButton(
                        text: "Choose File",
                        onPressed: () {
                          cubit.pickImage();
                        }),
                  ],
                );
        },
      ),
    );
  }
}
