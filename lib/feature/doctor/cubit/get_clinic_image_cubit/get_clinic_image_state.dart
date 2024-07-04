
import 'package:graduation_app/core/failure/failure.dart';

abstract class GetClinicImageState {}

class GetClinicImageInitial extends GetClinicImageState {}

class GetClinicImageLoading extends GetClinicImageState {}

class GetClinicImageSuccess extends GetClinicImageState
{

}

class GetClinicImageNotSelectedFailure extends GetClinicImageState {}
class GetClinicImageFailure extends GetClinicImageState {
  Failure failure;
  GetClinicImageFailure({required this.failure});
}