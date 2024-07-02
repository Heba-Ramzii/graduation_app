import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class DoctorRepo {

  Future<Either<Failure, void>> addClinic({required ClinicModel clinicModel});
  Future<Either<Failure, String?>> uploadImage({required XFile? image}) ;
}
