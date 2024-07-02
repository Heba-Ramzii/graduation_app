import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/cubit/register_cubit/register_state.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo/auth_repo_imp.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepoImp authRepoImp;
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterCubit(this.authRepoImp) : super(RegisterInitial());

  void register(
      {required String name,
      required String email,
      required String password,
      required bool isDoctor}) async {
    emit(RegisterLoading());
    final result = await authRepoImp.signup(
        name: name, email: email, password: password, isDoctor: isDoctor);
    result.fold((l) => emit(RegisterFailure(failure: l)),
        (r) => emit(RegisterSuccess()));
  }
}
