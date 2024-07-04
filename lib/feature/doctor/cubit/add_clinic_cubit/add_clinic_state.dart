import 'package:graduation_app/core/failure/failure.dart';

abstract class AddClinicState {}

class AddClinicInitial extends AddClinicState {}

class AddClinicLoading extends AddClinicState {}

class AddClinicSuccess extends AddClinicState {
}

class AddClinicFailure extends AddClinicState {
  Failure failure;
  AddClinicFailure({required this.failure});
}