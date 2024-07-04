import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/forget_pass_cubit/forget_pass_state.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate padding based on screen size
    final logoPaddingTop = screenHeight * 0.1;
    final logoPaddingLeft = screenWidth * 0.25;
    final logoPaddingRight = screenWidth * 0.25;
    final logoPaddingBottom = screenHeight * 0.05;
    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  logoPaddingLeft,
                  logoPaddingTop,
                  logoPaddingRight,
                  logoPaddingBottom,
                ),
                child: Image.asset('assets/images/Logo.png'),
              ),
              Center(
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.04,
                      horizontal: screenWidth * 0.02),
                  decoration: ShapeDecoration(
                    color: ColorsManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Forget Password',
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
                      BlocConsumer<ForgetPassCubit, ForgetPassState>(
                          listener: (context, state) {
                        if (state is ForgetPassSuccess) {
                          callMyToast(
                              massage: 'Reset Email sent successfully',
                              state: ToastState.SUCCESS);
                          goTo(context, const LoginScreen());
                        } else if (state is ForgetPassFailure) {
                          callMyToast(
                              massage: state.failure.message,
                              state: ToastState.ERROR);
                        }
                      }, builder: (context, state) {
                        if (state is ForgetPassLoading) {
                          return const DefaultLoading();
                        } else {
                          return CustomMaterialButton(
                            text: "Send Reset Email",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ForgetPassCubit.get(context).forgetPass(
                                  email: emailController.text,
                                );
                              }
                            },
                          );
                        }
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
