import 'package:graduation_app/core/failure/failure.dart';

abstract class ConfirmState {}

class ConfirmInitial extends ConfirmState {}

class ConfirmLoading extends ConfirmState {}

class ConfirmSuccess extends ConfirmState {}

class ConfirmFailure extends ConfirmState {
  Failure failure;
  ConfirmFailure({required this.failure});
}
