import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
import 'package:graduation_app/feature/patient/data/repo/patient_repo/patient_repo_imp.dart';
import 'update_patient_state.dart';

class UpdatePatientCubit extends Cubit<UpdatePatientState> {
  final PatientRepoImp patientRepoImp;

  static UpdatePatientCubit get(context) => BlocProvider.of(context);

  UpdatePatientCubit(this.patientRepoImp) : super(UpdatePatientInitial());

  void updatePatient({required PatientModel patientModel}) async {
    emit(UpdatePatientLoading());
    if (patientModel.image != null) {
      final result = await patientRepoImp.uploadImage(image: patientModel.image);
      result.fold((l) => emit(UpdatePatientFailure(failure: l)), (r) {
        patientModel.imagePath = r;
      });
    }
    final result = await patientRepoImp.updatePatient(patientModel: patientModel);
    result.fold((l) => emit(UpdatePatientFailure(failure: l)), (r) {
      return emit(UpdatePatientSuccess());
    });
  }
}
