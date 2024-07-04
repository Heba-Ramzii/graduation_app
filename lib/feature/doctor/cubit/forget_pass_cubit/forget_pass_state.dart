import 'package:graduation_app/core/failure/failure.dart';

abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassSuccess extends ForgetPassState {}

class ForgetPassFailure extends ForgetPassState {
  Failure failure;
  ForgetPassFailure({required this.failure});
}
