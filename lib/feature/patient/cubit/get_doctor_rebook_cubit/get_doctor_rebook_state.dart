import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

abstract class GetDoctorRebookState {}

class GetDoctorRebookInitial extends GetDoctorRebookState {}

class GetDoctorRebookLoading extends GetDoctorRebookState {}

class GetDoctorRebookSuccess extends GetDoctorRebookState {
  DoctorModel doctorModel;
  GetDoctorRebookSuccess({required this.doctorModel});
}

class GetDoctorRebookFailure extends GetDoctorRebookState {
  Failure failure;
  GetDoctorRebookFailure({required this.failure});
}
