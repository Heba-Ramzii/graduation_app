import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/app/app.dart';
import 'package:graduation_app/core/services/service_locator.dart';

import 'core/dio_helper/dio_helper.dart';
import 'feature/doctor/widgets/report_pdf/create.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DioHelper.init();
  setupSingleton();
  runApp(const MyApp());
}
