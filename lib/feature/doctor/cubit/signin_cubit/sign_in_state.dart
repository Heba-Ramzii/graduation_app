import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  AuthModel authModel;
  SignInSuccess({required this.authModel});
}

class SignInFailure extends SignInState {
  Failure failure;
  SignInFailure({required this.failure});
}
