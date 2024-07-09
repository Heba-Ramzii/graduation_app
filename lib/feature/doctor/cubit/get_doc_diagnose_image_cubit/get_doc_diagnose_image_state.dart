import 'package:graduation_app/core/failure/failure.dart';

abstract class GetDocDiagnoseImageState {}

class GetDocDiagnoseImageInitial extends GetDocDiagnoseImageState {}

class GetDocDiagnoseImageLoading extends GetDocDiagnoseImageState {}

class GetDocDiagnoseImageSuccess extends GetDocDiagnoseImageState {}

class GetDocDiagnoseImageNotSelectedFailure extends GetDocDiagnoseImageState {}

class GetDocDiagnoseImageFailure extends GetDocDiagnoseImageState {
  Failure failure;
  GetDocDiagnoseImageFailure({required this.failure});
}
