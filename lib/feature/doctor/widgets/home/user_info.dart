import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_state.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';

import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        padding: const EdgeInsets.all(12),
        decoration: StyleManager.containerDecoration,
        child: BlocConsumer<GetDoctorCubit, GetDoctorState>(
            listener: (context, state) {
          if (state is GetDoctorFailure) {
            callMyToast(
                massage: state.failure.message, state: ToastState.ERROR);
            goToFinish(context, const LoginScreen());
          }
        }, builder: (context, state) {
          return Row(
            children: [
              ProfileImage(
                height: 60,
                width: 60,
                size: 60,
                url: state is GetDoctorSuccess
                    ? state.doctorModel.imagePath
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: StyleManager.textStyle12.copyWith(
                          fontSize: 13, color: ColorsManager.primaryLight),
                    ),
                    Text(
                      state is GetDoctorSuccess
                          ? state.doctorModel.name ?? 'Dr. '
                          : 'Dr. ',
                      style: StyleManager.textStyle14mid,
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
