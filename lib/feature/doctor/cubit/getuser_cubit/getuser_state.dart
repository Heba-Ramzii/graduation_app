import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

abstract class GetUserState {}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState
{
  AuthModel authModel;
  GetUserSuccess({required this.authModel});
}

class GetUserFailure extends GetUserState {
  Failure failure;
  GetUserFailure({required this.failure});
}