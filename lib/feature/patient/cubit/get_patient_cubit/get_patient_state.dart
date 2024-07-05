import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';

  abstract class GetPatientState {}

    class GetPatientInitial extends GetPatientState {}

    class GetPatientLoading extends GetPatientState {}

    class GetPatientSuccess extends GetPatientState {
    PatientModel patientModel;
    GetPatientSuccess({required this.patientModel});
}

    class GetPatientFailure extends GetPatientState {
  Failure failure;
    GetPatientFailure({required this.failure});
}
