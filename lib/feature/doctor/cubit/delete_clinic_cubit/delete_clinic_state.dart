import 'package:graduation_app/core/failure/failure.dart';

  abstract class DeleteClinicState {}

    class DeleteClinicInitial extends DeleteClinicState {}

    class DeleteClinicLoading extends DeleteClinicState {}

    class DeleteClinicSuccess extends DeleteClinicState {
}

    class DeleteClinicFailure extends DeleteClinicState {
  Failure failure;
    DeleteClinicFailure({required this.failure});
}