import 'package:graduation_app/core/failure/failure.dart';

abstract class UpdateDoctorState {}

class UpdateDoctorInitial extends UpdateDoctorState {}

class UpdateDoctorLoading extends UpdateDoctorState {}

class UpdateDoctorSuccess extends UpdateDoctorState {}

class UpdateDoctorFailure extends UpdateDoctorState {
  Failure failure;
  UpdateDoctorFailure({required this.failure});
}
