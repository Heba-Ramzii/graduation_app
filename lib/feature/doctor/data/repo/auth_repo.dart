import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> login(
      {required String email, required String password});
  Future<Either<Failure, void>> signup(
      {required bool isDoctor,
      required String name,
      required String email,
      required String password});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> forgetPassword({required String email});
  Future<Either<Failure, AuthModel>> getUser();
}
