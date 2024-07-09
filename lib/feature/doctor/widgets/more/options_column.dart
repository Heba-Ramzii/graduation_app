import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/feature/doctor/cubit/logout_cubit/logout_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/logout_cubit/logout_state.dart';
import 'package:graduation_app/feature/doctor/widgets/more/option_row.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';
import 'package:graduation_app/feature/patient/layout/payment_screen.dart';

import '../../../../core/theme_manager/colors_manager.dart';
import '../../pages/doctor_clinics/add_clinic.dart';
import '../../pages/more/profile/doctor_profile.dart';
import '../../pages/more/settings/settings_screen.dart';

class OptionsColumn extends StatelessWidget {
  const OptionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionRow(
            icon: IconlyLight.profile,
            onTap: () {
              navigateToScreen(context, const DoctorProfileScreen());
            },
            text: "Profile"),
        OptionRow(
            icon: Icons.add_business_outlined,
            onTap: () {
              navigateToScreen(context, AddClinic());
            },
            text: "Add clinic"),
        const SizedBox(
          height: 17,
        ),
        Row(
          children: [
            const Icon(
              IconlyLight.logout,
              size: 25,
              color: ColorsManager.red,
            ),
            const SizedBox(
              width: 40,
            ),
            BlocConsumer<LogoutCubit, LogoutState>(
              builder: (context, state) {
                if (state is LogoutLoading) {
                  return const DefaultLoading();
                } else {
                  return CustomTextButton(
                    text: "Log Out",
                    onPressed: () {
                      showMyDialog(context, "Log Out", "Yes, Log Out", () {
                        LogoutCubit.get(context).logout();
                      });
                    },
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontColor: ColorsManager.font,
                  );
                }
              },
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  goToFinish(context, const LoginScreen());
                } else if (state is LogoutFailure) {
                  callMyToast(
                      massage: state.failure.message, state: ToastState.ERROR);
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
