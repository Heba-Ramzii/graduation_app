import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/models/ai_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_repo/doctor_repo_imp.dart';
import 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmState> {
  final DoctorRepoImp doctorRepoImp;
  static ConfirmCubit get(context) => BlocProvider.of(context);

  ConfirmCubit(this.doctorRepoImp) : super(ConfirmInitial());

  void confirm(
      {required DoctorModel doctorModel,
        required AIModel? model,

      required String patientId,
      required String patientBookModelId}) async {
    emit(ConfirmLoading());

    final result = await doctorRepoImp.confirmAppointment(
        model: model,
        doctorModel: doctorModel,
        patientId: patientId,
        patientBookModelId: patientBookModelId);
    result.fold((l) => emit(ConfirmFailure(failure: l)), (r) {
      return emit(ConfirmSuccess());
    });
  }
}
