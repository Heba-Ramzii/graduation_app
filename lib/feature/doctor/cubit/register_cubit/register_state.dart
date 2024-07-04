import 'package:graduation_app/core/failure/failure.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  Failure failure;
  RegisterFailure({required this.failure});
}