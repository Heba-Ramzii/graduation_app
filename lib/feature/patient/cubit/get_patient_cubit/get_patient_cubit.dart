import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/patient/data/repo/patient_repo/patient_repo_imp.dart';
import 'get_patient_state.dart';

class GetPatientCubit extends Cubit<GetPatientState> {
  final PatientRepoImp patientRepoImp;
  static GetPatientCubit get(context) => BlocProvider.of(context);

  GetPatientCubit(this.patientRepoImp) : super(GetPatientInitial());

  void getPatient() async {
    emit(GetPatientLoading());
    final result = await patientRepoImp.getPatient();
    result.fold((l) => emit(GetPatientFailure(failure: l)),
        (r) => emit(GetPatientSuccess(patientModel: r)));
  }
}
