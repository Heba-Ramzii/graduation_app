import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

abstract class GetClinicAppointmentState {}

class GetClinicAppointmentInitial extends GetClinicAppointmentState {}

class GetClinicAppointmentLoading extends GetClinicAppointmentState {}

class GetClinicAppointmentSuccess extends GetClinicAppointmentState {
  List<AppointmentModel> appointmentModels;
  GetClinicAppointmentSuccess({required this.appointmentModels});
}

class GetClinicAppointmentFailure extends GetClinicAppointmentState {
  Failure failure;
  GetClinicAppointmentFailure({required this.failure});
}
