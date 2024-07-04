import 'package:graduation_app/core/failure/failure.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutFailure extends LogoutState {
  Failure failure;
  LogoutFailure({required this.failure});
}