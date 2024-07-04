import 'package:graduation_app/core/failure/failure.dart';

  abstract class EditClinicState {}

    class EditClinicInitial extends EditClinicState {}

    class EditClinicLoading extends EditClinicState {}

    class EditClinicSuccess extends EditClinicState {
}

    class EditClinicFailure extends EditClinicState {
  Failure failure;
    EditClinicFailure({required this.failure});
}