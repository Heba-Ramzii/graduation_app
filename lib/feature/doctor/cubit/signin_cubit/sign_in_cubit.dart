import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo/auth_repo_imp.dart';

import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepoImp authRepoImp;
  static SignInCubit get(context) => BlocProvider.of(context);

  SignInCubit(this.authRepoImp) : super(SignInInitial());
  void signIn({required String email, required String password}) async {
    emit(SignInLoading());
    final result = await authRepoImp.login(email: email, password: password);
    result.fold((l) => emit(SignInFailure(failure: l)),
        (r) => emit(SignInSuccess(authModel: r)));
  }
}
