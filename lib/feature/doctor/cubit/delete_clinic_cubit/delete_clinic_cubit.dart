import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_repo/doctor_repo_imp.dart';
import 'delete_clinic_state.dart';

class DeleteClinicCubit extends Cubit<DeleteClinicState> {
  final DoctorRepoImp doctorRepoImp;
  static DeleteClinicCubit get(context) => BlocProvider.of(context);

  DeleteClinicCubit(this.doctorRepoImp) : super(DeleteClinicInitial());

  void deleteClinic (String clinicId) async {
    emit(DeleteClinicLoading());

    final result = await doctorRepoImp.deleteClinic(clinicId: clinicId);
    result.fold((l) => emit(DeleteClinicFailure(failure: l)), (r) {
      return emit(DeleteClinicSuccess());
    });
    }

}
