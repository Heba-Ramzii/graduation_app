import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/ai_model.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class DoctorRepo {
  Future<Either<Failure, DoctorModel>> getDoctorRebook(
      {required String doctorId});
  Future<Either<Failure, void>> addClinic({required ClinicModel clinicModel});
  Future<Either<Failure, void>> editClinic({required ClinicModel clinicModel});
  Future<Either<Failure, void>> updateDoctor(
      {required DoctorModel doctorModel});
  Future<Either<Failure, String?>> uploadImage({required XFile? image});
  Future<Either<Failure, DoctorModel>> getDoctor();
  Future<Either<Failure, List<AppointmentModel>>> getClinicAppointments(
      {required String clinicId, String? docID});
  Future<Either<Failure, void>> deleteClinic({required String clinicId});

  Future<Either<Failure, void>> confirmAppointment(
      {required DoctorModel doctorModel,
        required AIModel? model,
      required String patientId,
      required String patientBookModelId});
}
