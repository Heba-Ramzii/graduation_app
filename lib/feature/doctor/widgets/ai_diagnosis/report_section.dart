import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/feature/doctor/cubit/confirm_cubit/confirm_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/confirm_cubit/confirm_state.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

import '../../../../core/core_widgets/custom_material_button.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class ReportSection extends StatelessWidget {
  const ReportSection(
      {super.key, required this.patientId, required this.patientBookModelId});

  final String patientId;
  final String patientBookModelId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Type your report",
            style: StyleManager.mainTextStyle15.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          cursorColor: ColorsManager.primary,
          maxLines: null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsManager.primaryBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsManager.primaryBorder),
            ),
            filled: true,
            fillColor: ColorsManager.white,
            hintText: "Report...",
            hintStyle: StyleManager.textStyle12.copyWith(
              color: ColorsManager.primaryLight,
            ),
            prefixIcon: const Icon(
              IconlyBold.infoCircle,
              color: ColorsManager.primary,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocConsumer<ConfirmCubit, ConfirmState>(
          listener: (context, state) {
            if (state is ConfirmSuccess) {
              callMyToast(
                  massage: 'Confirm Success', state: ToastState.SUCCESS);
              Navigator.pop(context);
              Navigator.pop(context);
            }
            if (state is ConfirmFailure) {
              callMyToast(
                  massage: state.failure.message, state: ToastState.ERROR);
            }
          },
          builder: (context, state) {
            if (state is ConfirmLoading) {
              return const DefaultLoading();
            } else {
              return CustomMaterialButton(
                  text: "Confirm",
                  onPressed: () {
                    ConfirmCubit.get(context).confirm(
                        doctorModel: GetDoctorCubit.get(context).doctorModel!,
                        patientId: patientId,
                        patientBookModelId: patientBookModelId);
                  });
            }
          },
        ),
      ],
    );
  }
}
