import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class DoctorRepo {
  Future<Either<Failure, void>> addClinic({required ClinicModel clinicModel});
  Future<Either<Failure, void>> editClinic({required ClinicModel clinicModel});
  Future<Either<Failure, void>> updateDoctor(
      {required DoctorModel doctorModel});
  Future<Either<Failure, String?>> uploadImage({required XFile? image});
  Future<Either<Failure, DoctorModel>> getDoctor();
  Future<Either<Failure, List<AppointmentModel>>> getClinicAppointments(
      {required String clinicId});
}
