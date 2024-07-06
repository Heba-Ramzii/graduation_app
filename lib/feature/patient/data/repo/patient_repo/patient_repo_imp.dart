import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
import 'package:image_picker/image_picker.dart';
import 'patient_repo.dart';

class PatientRepoImp implements PatientRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, String?>> uploadImage({required XFile? image}) async {
    try {
      var response = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(image!.path).pathSegments.last}')
          .putFile(File(image.path));
      String url = await response.ref.getDownloadURL();
      return right(url);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, PatientModel>> getPatient() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      return right(PatientModel.fromJson(response.data()!));
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePatient(
      {required PatientModel patientModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(patientModel.toJson());
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }
}
