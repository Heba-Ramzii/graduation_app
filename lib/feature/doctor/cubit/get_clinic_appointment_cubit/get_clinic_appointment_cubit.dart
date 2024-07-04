import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/data/repo/doctor_reop/doctor_repo_imp.dart';
import 'get_clinic_appointment_state.dart';

class GetClinicAppointmentsCubit extends Cubit<GetClinicAppointmentState> {
  final DoctorRepoImp doctorRepoImp;
  static GetClinicAppointmentsCubit get(context) => BlocProvider.of(context);

  GetClinicAppointmentsCubit(this.doctorRepoImp) : super(GetClinicAppointmentInitial());

  void getClinicAppointment({required String clinicId}) async {
    emit(GetClinicAppointmentLoading());
    final result = await doctorRepoImp.getClinicAppointments(clinicId: clinicId);
    result.fold((l) => emit(GetClinicAppointmentFailure(failure: l)),
        (r) => emit(GetClinicAppointmentSuccess(appointmentModels: r)));
  }
}
