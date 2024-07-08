import 'package:graduation_app/core/failure/failure.dart';

abstract class AddNewClinicBookingState {}

class AddNewClinicBookingInitial extends AddNewClinicBookingState {}

class AddNewClinicBookingLoading extends AddNewClinicBookingState {}

class AddNewClinicBookingSuccess extends AddNewClinicBookingState {}

class AddNewClinicBookingFailed extends AddNewClinicBookingState {
  final Failure failure;

  AddNewClinicBookingFailed(this.failure);
}

