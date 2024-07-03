import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/cubit/ai_diagnosis_cubit.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/repo/ai_repo_imp.dart';

import 'core/dio_helper/dio_helper.dart';
import 'core/service/service_locator.dart';
import 'feature/doctor/pages/ai_diagnosis/ai_diagnosis.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  setupForgotPassSingleton();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AiDiagnosisCubit(getIt.get<AiRepoImp>())),
      ],
      child: MaterialApp(
        title: 'Graduation App',
        theme: ThemeData(
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
        home: const AIDiagnosisScreen(),
      ),
    );
  }
}
