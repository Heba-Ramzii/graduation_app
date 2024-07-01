import 'package:get_it/get_it.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo_imp.dart';

final getIt = GetIt.instance;

void setupSingleton() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
}
