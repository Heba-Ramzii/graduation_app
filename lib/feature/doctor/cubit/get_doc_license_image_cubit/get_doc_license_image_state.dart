import 'package:graduation_app/core/failure/failure.dart';

abstract class GetDocLicenseImageState {}

class GetDocLicenseImageInitial extends GetDocLicenseImageState {}

class GetDocLicenseImageLoading extends GetDocLicenseImageState {}

class GetDocLicenseImageSuccess extends GetDocLicenseImageState {}

class GetDocLicenseImageNotSelectedFailure extends GetDocLicenseImageState {}

class GetDocLicenseImageFailure extends GetDocLicenseImageState {
  Failure failure;
  GetDocLicenseImageFailure({required this.failure});
}
