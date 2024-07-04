import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_reop/doctor_repo_imp.dart';
import 'get_doctor_state.dart';

class GetDoctorCubit extends Cubit<GetDoctorState> {
  final DoctorRepoImp doctorRepoImp;
  static GetDoctorCubit get(context) => BlocProvider.of(context);

  GetDoctorCubit(this.doctorRepoImp) : super(GetDoctorInitial());

  void getDoctor() async {
    emit(GetDoctorLoading());
    final result = await doctorRepoImp.getDoctor();
    result.fold((l) => emit(GetDoctorFailure(failure: l)),
        (r) => emit(GetDoctorSuccess(doctorModel: r)));
  }
}
