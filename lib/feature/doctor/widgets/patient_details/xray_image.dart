import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/web_tost.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/ai_cubit/ai_diagnosis_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/ai_cubit/ai_diagnosis_state.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doc_diagnose_image_cubit/get_doc_diagnose_image_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doc_diagnose_image_cubit/get_doc_diagnose_image_state.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

import '../../../../generated/assets.dart';
import '../../pages/ai_diagnosis/ai-diagnosis_detected.dart';

class XrayImage extends StatelessWidget {
  const XrayImage(
      {super.key, required this.patientId, required this.patientBookModelId});

  final String patientId;
  final String patientBookModelId;

  @override
  Widget build(BuildContext context) {
    return Column(
     // alignment: AlignmentDirectional.bottomEnd,
      children: [
        BlocConsumer<AiDiagnosisCubit, AiDiagnosisState>(
          listener: (context, state) {
            if (state is AiDiagnosisErrorState) {
              webToast(context: context, message: state.errorMessage);
            } else if (state is AiDiagnosisSuccessState) {
              webToast(
                  context: context,
                  message: "success : ${state.result.result}");

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AIDiagnosisDetectedDoctorScreen(
                    patientId: patientId,
                    patientBookModelId: patientBookModelId,
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
              text: "Upload Image",
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
    );
  }
}

/*
  BlocConsumer<GetDocDiagnoseImageCubit,
            GetDocDiagnoseImageState>(
            listener: (context, state) {},
            builder: (context, imageState) {
              return CircleAvatar(
                radius: 52,
                backgroundColor: Colors.white,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                          50),
                      image: GetDocDiagnoseImageCubit.get(
                          context)
                          .diagnoseImage !=
                          null
                          ? DecorationImage(
                        image: FileImage(File(
                            GetDocDiagnoseImageCubit
                                .get(
                                context)
                                .diagnoseImage!
                                .path)),
                        fit: BoxFit.cover,
                      )
                          : null
                  ),
                  child: GetDocDiagnoseImageCubit.get(
                      context)
                      .diagnoseImage ==
                      null
                      ? const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  )
                      : null,
                ),
              );
            }),
        CircleAvatar(
          backgroundColor:
          ColorsManager.primary,
          radius: 18,
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: ColorsManager.white,
                size: 18,
              ),
              onPressed: () {
                GetDocDiagnoseImageCubit.get(
                    context)
                    .getImage();
              },
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Image.asset(
        //     Assets.imagesXray1,
        //     fit: BoxFit.contain,
        //   ),
        // ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AIDiagnosisDetectedDoctorScreen(
                          patientId: patientId,
                          patientBookModelId: patientBookModelId,
                        )
                )
            );
          },
          child: const CircleAvatar(
            backgroundColor: ColorsManager.secondary,
            child: Icon(
              IconlyBold.scan,
              color: ColorsManager.primary,
              size: 24,
            ),
          ),
        )
 */