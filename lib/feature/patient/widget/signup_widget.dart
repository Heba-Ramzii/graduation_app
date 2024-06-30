import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_button.dart';
import 'package:graduation_app/core/core_widgets/custom_text_form_field.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/register_cubit/register_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/register_cubit/register_state.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';
import '../../../core/theme_manager/style_manager.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key, required this.isDoctor});
  final bool isDoctor;

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: screenWidth * 0.9,
          padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04, horizontal: screenWidth * 0.02),
          decoration: ShapeDecoration(
            color: ColorsManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: ColorsManager.primary,
                    fontSize: screenWidth * 0.06, // Adjusted font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  label: "Name",
                  hint: "Enter your name",
                  colorFont: ColorsManager.black,
                ),
                SizedBox(height: screenWidth * 0.02), // Adjusted height
                CustomTextFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: "Email",
                  hint: "Enter your Email",
                  colorFont: ColorsManager.black,
                ),
                SizedBox(height: screenWidth * 0.02), // Adjusted height

                CustomTextFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  label: "Password",
                  hint: "Enter your password",
                  colorFont: ColorsManager.black,
                  isPassword: isPassword,
                  suffixPressed: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffixIcon: isPassword ? Icons.visibility : Icons.visibility_off,
                ),
                SizedBox(height: screenWidth * 0.02), // Adjusted height
                CustomTextFormField(
                  controller: confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  label: "Confirm Password",
                  isPassword: isPassword,
                  suffixPressed: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffixIcon: isPassword ? Icons.visibility : Icons.visibility_off,
                  hint: "Confirm your password",
                  colorFont: ColorsManager.black,
                ),
                SizedBox(height: screenWidth * 0.02), // Adjusted height
                BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                  if (state is RegisterSuccess) {
                    callMyToast(
                        massage: 'Registered successfully',
                        state: ToastState.SUCCESS);
                    goTo(context, const LoginScreen());
                  } else if (state is RegisterFailure) {
                    callMyToast(
                        massage: state.failure.message,
                        state: ToastState.ERROR);
                  }
                }, builder: (context, state) {
                  if (state is RegisterLoading) {
                    return const DefaultLoading();
                  }
                  return CustomMaterialButton(
                    text: "Sign up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          callMyToast(
                              massage: "Passwords don't match",
                              state: ToastState.ERROR);
                          return;
                        } else {
                          RegisterCubit.get(context).register(
                            isDoctor: widget.isDoctor,
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      }
                    },
                  );
                }),
                SizedBox(height: screenWidth * 0.03), // Adjusted height
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have an account ?",
                      style: StyleManager.mainTextStyle15.copyWith(
                        color: ColorsManager.grayFont,
                      ),
                    ),
                    CustomTextButton(
                      text: "  Login",
                      onPressed: () {
                        goTo(context, LoginScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
