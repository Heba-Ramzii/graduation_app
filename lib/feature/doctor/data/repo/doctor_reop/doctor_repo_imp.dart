import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:image_picker/image_picker.dart';
import 'doctor_repo.dart';

class DoctorRepoImp implements DoctorRepo {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, void>> addClinic({required ClinicModel clinicModel})async {
    try {

      String clinicId = FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('clinics').doc().id;
      WriteBatch batch = FirebaseFirestore.instance.batch();

      
      batch.set(FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('clinics').doc(clinicId), clinicModel.toJson());

      for (var element in clinicModel.appointments!) {
        element.clinicId = clinicId;
        batch.set(FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid).collection('appointments').doc(), element.toJson());
      }
      await batch.commit();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400",e.toString()));
    }
  }
  @override
  Future<Either<Failure, String?>> uploadImage({required XFile? image}) async {
    try
    {
      var response = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(image!.path).pathSegments.last}')
          .putFile(File(image.path));
      String url =  await response.ref.getDownloadURL();
      return right(url);
    }
    on FirebaseAuthException catch(e){
      return left(Failure.fromFirebaseError(e));
    }
    catch(e){
      return left(Failure("400",e.toString()));
    }

  }
}

