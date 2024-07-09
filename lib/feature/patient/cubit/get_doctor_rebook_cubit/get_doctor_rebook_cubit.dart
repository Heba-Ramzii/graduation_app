import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_repo/doctor_repo_imp.dart';
import 'get_doctor_rebook_state.dart';

class GetDoctorRebookCubit extends Cubit<GetDoctorRebookState> {
  final DoctorRepoImp doctorRepoImp;
  static GetDoctorRebookCubit get(context) => BlocProvider.of(context);

  GetDoctorRebookCubit(this.doctorRepoImp) : super(GetDoctorRebookInitial());

  void getDoctorRebook({required String doctorId}) async {
    emit(GetDoctorRebookLoading());
    final result = await doctorRepoImp.getDoctorRebook(doctorId: doctorId);
    result.fold((l) => emit(GetDoctorRebookFailure(failure: l)),
        (r) => emit(GetDoctorRebookSuccess(doctorModel: r)));
  }
}
