import 'package:get_it/get_it.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/repo/ai_repo_imp.dart';

final getIt = GetIt.instance;

void setupForgotPassSingleton() {
  getIt.registerSingleton<AiRepoImp>(AiRepoImp());
}
