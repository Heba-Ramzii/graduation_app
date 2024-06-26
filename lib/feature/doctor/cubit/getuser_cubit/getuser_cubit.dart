import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/auth_repo_imp.dart';

import 'getuser_state.dart';


class GetUserCubit extends Cubit<GetUserState> {
  final AuthRepoImp authRepoImp;
  static GetUserCubit get(context) => BlocProvider.of(context);

  GetUserCubit(this.authRepoImp) : super(GetUserInitial());

  void getUser ({required bool isDoctor}) async {
    emit(GetUserLoading());
    final result = await authRepoImp.getUser(isDoctor: isDoctor);
    result.fold((l) => emit(GetUserFailure(failure: l)), (r) =>
        emit(GetUserSuccess()));
  }
}
