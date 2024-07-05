import 'package:graduation_app/core/failure/failure.dart';

abstract class GetPatientImageState {}

class GetPatientImageInitial extends GetPatientImageState {}

class GetPatientImageLoading extends GetPatientImageState {}

class GetPatientImageSuccess extends GetPatientImageState {}

class GetPatientImageNotSelectedFailure extends GetPatientImageState {}

class GetPatientImageFailure extends GetPatientImageState {
  Failure failure;
  GetPatientImageFailure({required this.failure});
}
