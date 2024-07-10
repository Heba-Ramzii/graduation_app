import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_repo/doctor_repo_imp.dart';
import 'update_doctor_state.dart';

class UpdateDoctorCubit extends Cubit<UpdateDoctorState> {
  final DoctorRepoImp doctorRepoImp;
  static UpdateDoctorCubit get(context) => BlocProvider.of(context);

  UpdateDoctorCubit(this.doctorRepoImp) : super(UpdateDoctorInitial());

  void updateDoctor({required DoctorModel doctorModel}) async {
    emit(UpdateDoctorLoading());
    if (doctorModel.image != null) {
      final result = await doctorRepoImp.uploadImage(image: doctorModel.image);
      result.fold((l) => emit(UpdateDoctorFailure(failure: l)), (r) {
        doctorModel.imagePath = r;
      });
    }
    if (doctorModel.nationalIdImage != null) {
      final result =
          await doctorRepoImp.uploadImage(image: doctorModel.nationalIdImage);
      result.fold((l) => emit(UpdateDoctorFailure(failure: l)), (r) {
        doctorModel.nationalIdImagePath = r;
      });
    }
    if (doctorModel.licenseImage != null) {
      final result =
          await doctorRepoImp.uploadImage(image: doctorModel.licenseImage);
      result.fold((l) => emit(UpdateDoctorFailure(failure: l)), (r) {
        doctorModel.licenseImagePath = r;
      });
    }
    final result = await doctorRepoImp.updateDoctor(doctorModel: doctorModel);
    result.fold((l) => emit(UpdateDoctorFailure(failure: l)), (r) {
      return emit(UpdateDoctorSuccess());
    });
  }
}
