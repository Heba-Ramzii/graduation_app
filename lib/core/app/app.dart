import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/services/service_locator.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/add_clinic_cubit/add_clinic_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doc_image_cubit/get_doc_image_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/getuser_cubit/getuser_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/logout_cubit/logout_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/register_cubit/register_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/signin_cubit/sign_in_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/update_doctor_cubit/update_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo/auth_repo_imp.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_reop/doctor_repo_imp.dart';
import 'package:graduation_app/feature/patient/layout/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetUserCubit(getIt.get<AuthRepoImp>())),
        BlocProvider(
            create: (context) => GetDoctorCubit(getIt.get<DoctorRepoImp>())),
        BlocProvider(
            create: (context) => UpdateDoctorCubit(getIt.get<DoctorRepoImp>())),
        BlocProvider(
            create: (context) => ForgetPassCubit(getIt.get<AuthRepoImp>())),
        BlocProvider(
            create: (context) => LogoutCubit(getIt.get<AuthRepoImp>())),
        BlocProvider(
            create: (context) => SignInCubit(getIt.get<AuthRepoImp>())),
        BlocProvider(
            create: (context) => RegisterCubit(getIt.get<AuthRepoImp>())),
        BlocProvider(create: (context) => GetClinicImageCubit()),
        BlocProvider(create: (context) => GetDocImageCubit()),
        BlocProvider(
            create: (context) => AddClinicCubit(getIt.get<DoctorRepoImp>())),
      ],
      child: MaterialApp(
        title: 'Graduation App',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.homePageBackground,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            color: ColorsManager.white,
          ),
          primaryColor: ColorsManager.primaryMaterialColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsManager.primaryMaterialColor,
          ),
          iconTheme: const IconThemeData(
            color: ColorsManager.primary,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: ColorsManager.primaryMaterialColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
