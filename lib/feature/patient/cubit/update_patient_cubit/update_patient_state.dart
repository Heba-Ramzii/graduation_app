import 'package:graduation_app/core/failure/failure.dart';

abstract class UpdatePatientState {}

class UpdatePatientInitial extends UpdatePatientState {}

class UpdatePatientLoading extends UpdatePatientState {}

class UpdatePatientSuccess extends UpdatePatientState {}

class UpdatePatientFailure extends UpdatePatientState {
  Failure failure;
  UpdatePatientFailure({required this.failure});
}
