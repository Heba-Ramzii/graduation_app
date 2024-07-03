import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

abstract class GetDoctorState {}

class GetDoctorInitial extends GetDoctorState {}

class GetDoctorLoading extends GetDoctorState {}

class GetDoctorSuccess extends GetDoctorState {
  DoctorModel doctorModel;
  GetDoctorSuccess({required this.doctorModel});
}

class GetDoctorFailure extends GetDoctorState {
  Failure failure;
  GetDoctorFailure({required this.failure});
}
