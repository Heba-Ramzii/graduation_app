
import 'package:graduation_app/core/failure/failure.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  Failure failure;
  SignInFailure({required this.failure});
}