import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_reop/doctor_repo_imp.dart';
import 'add_clinic_state.dart';

class AddClinicCubit extends Cubit<AddClinicState> {
  final DoctorRepoImp doctorRepoImp;
  static AddClinicCubit get(context) => BlocProvider.of(context);

  AddClinicCubit(this.doctorRepoImp) : super(AddClinicInitial());

  void addClinic (ClinicModel clinicModel) async {
    emit(AddClinicLoading());
    if(clinicModel.image != null)
    {

      final result = await doctorRepoImp.uploadImage(image: clinicModel.image);
      result.fold((l) => emit(AddClinicFailure(failure: l)), (r) {
        clinicModel.imagePath = r;
      });
    }
    final result = await doctorRepoImp.addClinic(clinicModel: clinicModel);
    result.fold((l) => emit(AddClinicFailure(failure: l)), (r) {
      return emit(AddClinicSuccess());
    });
    }

}
