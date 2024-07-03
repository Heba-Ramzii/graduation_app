import 'package:graduation_app/core/failure/failure.dart';

abstract class GetDocImageState {}

class GetDocImageInitial extends GetDocImageState {}

class GetDocImageLoading extends GetDocImageState {}

class GetDocImageSuccess extends GetDocImageState {}

class GetDocImageNotSelectedFailure extends GetDocImageState {}

class GetDocImageFailure extends GetDocImageState {
  Failure failure;
  GetDocImageFailure({required this.failure});
}
