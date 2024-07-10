import 'package:graduation_app/core/failure/failure.dart';

abstract class GetDocIDImageState {}

class GetDocIDImageInitial extends GetDocIDImageState {}

class GetDocIDImageLoading extends GetDocIDImageState {}

class GetDocIDImageSuccess extends GetDocIDImageState {}

class GetDocIDImageNotSelectedFailure extends GetDocIDImageState {}

class GetDocIDImageFailure extends GetDocIDImageState {
  Failure failure;
  GetDocIDImageFailure({required this.failure});
}
