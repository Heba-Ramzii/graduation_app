import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class PatientRepo {
  Future<Either<Failure, String?>> uploadImage({required XFile? image});
  Future<Either<Failure, PatientModel>> getPatient();
  Future<Either<Failure, void>> updatePatient(
      {required PatientModel patientModel});
  Future<Either<Failure, void>> addNewClinicBooking({required BookModel bookModel,
    required PatientBookModel patientBookModel
  });
  Future<Either<Failure, void>> deleteBook({required PatientBookModel patientBookModel});
}
