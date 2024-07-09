import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/ai_model.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
import 'package:image_picker/image_picker.dart';
import 'doctor_repo.dart';

class DoctorRepoImp implements DoctorRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, void>> addClinic(
      {required ClinicModel clinicModel}) async {
    try {
      String clinicId = FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('clinics')
          .doc()
          .id;
      WriteBatch batch = FirebaseFirestore.instance.batch();
      clinicModel.id = clinicId;

      batch.set(
          FirebaseFirestore.instance
              .collection('users')
              .doc(_firebaseAuth.currentUser!.uid)
              .collection('clinics')
              .doc(clinicModel.id),
          clinicModel.toJson());

      for (var element in clinicModel.appointments!) {
        element.clinicId = clinicId;
        String appointmentId = FirebaseFirestore.instance
            .collection('users')
            .doc(_firebaseAuth.currentUser!.uid)
            .collection('appointments')
            .doc()
            .id;
        element.id = appointmentId;
        batch.set(
            FirebaseFirestore.instance
                .collection('users')
                .doc(_firebaseAuth.currentUser!.uid)
                .collection('appointments')
                .doc(element.id),
            element.toJson());
      }
      await batch.commit();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

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
  Future<Either<Failure, DoctorModel>> getDoctor() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      return right(DoctorModel.fromJson(response.data()!));
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, DoctorModel>> getDoctorRebook(
      {required String doctorId}) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(doctorId)
          .get();
      return right(DoctorModel.fromJson(response.data()!));
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDoctor(
      {required DoctorModel doctorModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(doctorModel.toJson());
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editClinic(
      {required ClinicModel clinicModel}) async {
    try {
      WriteBatch batch = FirebaseFirestore.instance.batch();
      batch.update(
          FirebaseFirestore.instance
              .collection('users')
              .doc(_firebaseAuth.currentUser!.uid)
              .collection('clinics')
              .doc(clinicModel.id),
          clinicModel.toJson());
      for (var element in clinicModel.appointments!) {
        if (element.isDeleted) {
          batch.delete(FirebaseFirestore.instance
              .collection('users')
              .doc(_firebaseAuth.currentUser!.uid)
              .collection('appointments')
              .doc(element.id));
        } else if (element.isNew) {
          String appointmentId = FirebaseFirestore.instance
              .collection('users')
              .doc(_firebaseAuth.currentUser!.uid)
              .collection('appointments')
              .doc()
              .id;
          element.clinicId = clinicModel.id;
          element.id = appointmentId;
          batch.set(
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(_firebaseAuth.currentUser!.uid)
                  .collection('appointments')
                  .doc(element.id),
              element.toJson());
        } else {
          batch.update(
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(_firebaseAuth.currentUser!.uid)
                  .collection('appointments')
                  .doc(element.id),
              element.toJson());
        }
      }
      await batch.commit();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getClinicAppointments(
      {required String clinicId, String? docID}) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(docID ?? _firebaseAuth.currentUser!.uid)
          .collection('appointments')
          .where("clinicId", isEqualTo: clinicId)
          .get();
      List<AppointmentModel> appointments = [];
      await Future.forEach(response.docs, (element) {
        debugPrint('test ++++');
        appointments.add(AppointmentModel.fromJson(element.data()));
      });

      return right(appointments);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteClinic({required String clinicId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('clinics')
          .doc(clinicId)
          .delete();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> confirmAppointment(
      {required DoctorModel doctorModel,
        required AIModel? model,
      required String patientId,
      required String patientBookModelId}) async {
    try {
      WriteBatch batch = FirebaseFirestore.instance.batch();
      batch.update(
          FirebaseFirestore.instance
              .collection('patientsBooks')
              .doc(patientBookModelId),
          {"status": 2});

      doctorModel.patientsID.add(patientId);
      batch.update(
          FirebaseFirestore.instance.collection('users').doc(doctorModel.id),
          {'patientsID': doctorModel.patientsID});

      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(patientId)
          .get();
      PatientModel patientModel = PatientModel.fromJson(response.data()!);
      patientModel.doctorsID.add(doctorModel.id!);

      batch.update(
          FirebaseFirestore.instance.collection('users').doc(patientModel.id),
          {'doctorsID': patientModel.doctorsID});

      String chatID = '${doctorModel.id}:$patientId';
      var chatResponse = await FirebaseFirestore.instance
          .collection('chat')
      .doc(chatID)
          .get();
      if(!chatResponse.exists){
        batch.set( FirebaseFirestore.instance.collection('chat').doc(chatID), {
          'id': chatID,
          'doctorId': doctorModel.id,
          'patientId': patientId,
        });
      }
      batch.set( FirebaseFirestore.instance.collection('chat').doc(chatID)
          .collection('messages').doc(), {
        'message': model!.report,
        'senderIsDoctor': true,
        'time': Timestamp.fromDate( DateTime.now()),
      });

      await batch.commit();

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }
}
