import 'package:get_it/get_it.dart';
import 'package:graduation_app/feature/doctor/data/repo/ai_repo/ai_repo_imp.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo/auth_repo_imp.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_repo/doctor_repo_imp.dart';
import 'package:graduation_app/feature/patient/data/repo/patient_repo/patient_repo_imp.dart';

final getIt = GetIt.instance;

void setupSingleton() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
  getIt.registerSingleton<DoctorRepoImp>(DoctorRepoImp());
  getIt.registerSingleton<PatientRepoImp>(PatientRepoImp());
  getIt.registerSingleton<AiRepoImp>(AiRepoImp());
}
