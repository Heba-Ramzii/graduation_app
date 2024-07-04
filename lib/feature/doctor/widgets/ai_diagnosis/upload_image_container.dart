import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/web_tost.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/ai-diagnosis_detected.dart';
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
      child: Column(
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
          BlocConsumer<AiDiagnosisCubit, AiDiagnosisState>(
            listener: (context, state) {
              if (state is AiDiagnosisErrorState) {
                webToast(context: context, message: state.errorMessage);
              } else if (state is AiDiagnosisSuccessState) {
                webToast(
                    context: context,
                    message: "success : ${state.result.result}");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AIDiagnosisDetectedScreen(
                          model: state.result,
                          image: AiDiagnosisCubit.get(context).image,
                        )));
              }
            },
            builder: (context, state) {
              var cubit = AiDiagnosisCubit.get(context);
              return state is AiDiagnosisLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : CustomMaterialButton(
                      text: "Choose File",
                      onPressed: () {
                        cubit.pickImage().then((value) {
                          if (cubit.image != null) {
                            cubit.aiDiagnosis(doctorId: 10).then((value) {});
                          }
                        });
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
