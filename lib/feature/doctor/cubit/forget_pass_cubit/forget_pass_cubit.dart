import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo/auth_repo_imp.dart';

import 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final AuthRepoImp authRepoImp;
  static ForgetPassCubit get(context) => BlocProvider.of(context);

  ForgetPassCubit(this.authRepoImp) : super(ForgetPassInitial());

  void forgetPass({required String email}) async {
    emit(ForgetPassLoading());
    final result = await authRepoImp.forgetPassword(email: email);
    result.fold((l) => emit(ForgetPassFailure(failure: l)),
        (r) => emit(ForgetPassSuccess()));
  }
}
