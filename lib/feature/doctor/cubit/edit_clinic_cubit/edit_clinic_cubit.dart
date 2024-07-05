import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_repo/doctor_repo_imp.dart';
import 'edit_clinic_state.dart';

class EditClinicCubit extends Cubit<EditClinicState> {
  final DoctorRepoImp doctorRepoImp;
  static EditClinicCubit get(context) => BlocProvider.of(context);

  EditClinicCubit(this.doctorRepoImp) : super(EditClinicInitial());

  void editClinic (ClinicModel clinicModel) async {
    emit(EditClinicLoading());
    if(clinicModel.image != null)
    {

      final result = await doctorRepoImp.uploadImage(image: clinicModel.image);
      result.fold((l) => emit(EditClinicFailure(failure: l)), (r) {
        clinicModel.imagePath = r;
      });
    }
    final result = await doctorRepoImp.editClinic(clinicModel: clinicModel);
    result.fold((l) => emit(EditClinicFailure(failure: l)), (r) {
      return emit(EditClinicSuccess());
    });
    }

}
