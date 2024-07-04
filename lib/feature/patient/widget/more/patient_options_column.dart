import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/logout_cubit/logout_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/logout_cubit/logout_state.dart';
import 'package:graduation_app/feature/doctor/pages/more/profile/patient_profile.dart';
import 'package:graduation_app/feature/doctor/pages/more/settings/settings_screen.dart';
import 'package:graduation_app/feature/doctor/widgets/more/option_row.dart';
import 'package:graduation_app/feature/patient/layout/favorites_screen.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';
import 'package:graduation_app/feature/patient/layout/payment_screen.dart';



class PatientOptionsColumn extends StatelessWidget {
  const PatientOptionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionRow(
            icon: IconlyLight.profile,
            onTap: () {
              navigateToScreen(context, const PatientProfileScreen());
            },
            text: "Profile"),
        OptionRow(
            icon: Icons.favorite_border_rounded,
            onTap: () {
              navigateToScreen(context, const FavoritesScreen());
            },
            text: "Favorite"),
        OptionRow(
            icon: Icons.payment_rounded,
            onTap: () {
              navigateToScreen(context, const PaymentScreen());
            },
            text: "Payments"),
        OptionRow(
            icon: Icons.settings_outlined,
            onTap: () {
              navigateToScreen(context, const SettingsScreen());
            },
            text: "Settings"),
        OptionRow(
            icon: Icons.help_outline_rounded,
            onTap: () {},
            text: "Help Center "),
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
            BlocConsumer<LogoutCubit,LogoutState>(
              builder: (context, state) {
                if(state is LogoutLoading){
                  return const DefaultLoading();
                }
                else{
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
              } ,
              listener: (context, state) {
                if(state is LogoutSuccess){
                  goToFinish(context, const LoginScreen());
                }
                else if(state is LogoutFailure){
                  callMyToast(massage: state.failure.message, state: ToastState.ERROR);
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
