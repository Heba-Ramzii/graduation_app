import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/signin_cubit/sign_in_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/signin_cubit/sign_in_state.dart';
import 'package:graduation_app/feature/doctor/pages/home/main_screen.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_cubit.dart';
import 'package:graduation_app/feature/patient/layout/onboarding_screen.dart';
import 'package:graduation_app/feature/patient/layout/patient_home_screen.dart';
import 'package:graduation_app/feature/patient/widget/forget_password.dart';

import '../../../core/function/core_function.dart';
import '../../../core/theme_manager/style_manager.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04, horizontal: screenWidth * 0.02),
        decoration: ShapeDecoration(
          color: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: ColorsManager.primary,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              label: "Email",
              prefixIcon: Icons.email,
              hint: "Enter your email",
              colorFont: ColorsManager.black,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: passwordController,
              type: TextInputType.visiblePassword,
              label: "Password",
              isPassword: isPassword,
              suffixPressed: () => {
                setState(() {
                  isPassword = !isPassword;
                })
              },
              suffixIcon: isPassword ? Icons.visibility : Icons.visibility_off,
              hint: "Enter your password",
              colorFont: ColorsManager.black,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                text: "Forget Password?",
                onPressed: () => {goTo(context, const ForgetPasswordScreen())},
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
              if (state is SignInSuccess) {
                callMyToast(
                    massage: 'Login Success', state: ToastState.SUCCESS);
                if(state.authModel.isDoctor!)
                {
                  GetDoctorCubit.get(context).getDoctor();
                }
                else
                {
                  GetPatientCubit.get(context).getPatient();
                }
                goTo(
                    context,
                    state.authModel.isDoctor!
                        ? const DoctorView()
                        : const PatientHome());
              } else if (state is SignInFailure) {
                callMyToast(
                    massage: state.failure.message, state: ToastState.ERROR);
              }
            }, builder: (context, state) {
              if (state is SignInLoading) {
                return const DefaultLoading();
              } else {
                return CustomMaterialButton(
                  text: "Login",
                  onPressed: () {
                    SignInCubit.get(context).signIn(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                );
              }
            }),
            const SizedBox(height: 10),
            SizedBox(height: screenWidth * 0.03), // Adjusted height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: StyleManager.mainTextStyle15.copyWith(
                    color: ColorsManager.grayFont,
                  ),
                ),
                CustomTextButton(
                  text: "  Sign up",
                  onPressed: () => {
                    navigateToScreen(
                      context,
                      const OnboardingScreen(),
                    ),
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
