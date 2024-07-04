import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/getuser_cubit/getuser_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/getuser_cubit/getuser_state.dart';
import 'package:graduation_app/feature/patient/layout/login_screen.dart';
import 'package:graduation_app/feature/patient/layout/patient_home_screen.dart';
import 'package:graduation_app/generated/assets.dart';

import '../../doctor/pages/home/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        this.user = null;
      } else {
        GetUserCubit.get(context).getUser();
        this.user = user;
        debugPrint('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<GetUserCubit, GetUserState>(listener: (context, state) {
        if (state is GetUserFailure) {
          callMyToast(massage: state.failure.message, state: ToastState.ERROR);
          goToFinish(context, const LoginScreen());
        }
      }, builder: (context, state) {
        Widget nextScreen;
        if (user == null) {
          nextScreen = const LoginScreen();
        } else if (state is GetUserSuccess) {
          if (state.userData['isDoctor'] == null) {
            nextScreen = const LoginScreen();
          } else {
            if (state.userData['isDoctor']) {
              GetDoctorCubit.get(context).getDoctor();
              nextScreen = const DoctorView();
            } else {
              nextScreen = const PatientHome();
            }
          }
        } else {
          nextScreen = const DefaultLoading();
        }
        return AnimatedSplashScreen(
          animationDuration: const Duration(milliseconds: 1000),
          centered: true,
          backgroundColor: ColorsManager.primary,
          splash: Assets.imagesDoctorAssistant1,
          splashIconSize: 100,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: nextScreen,
        );
      }),
    );
  }
}
