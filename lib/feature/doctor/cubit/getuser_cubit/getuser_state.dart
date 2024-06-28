import 'package:graduation_app/core/failure/failure.dart';

abstract class GetUserState {}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {}

class GetUserFailure extends GetUserState {
  Failure failure;
  GetUserFailure({required this.failure});
}