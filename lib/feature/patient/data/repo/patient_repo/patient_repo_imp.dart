import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
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

  @override
  Future<Either<Failure, void>> addNewClinicBooking(
      {required BookModel bookModel,
      required PatientBookModel patientBookModel}) async {
    try {
      DateTime nextDayTime = getNextDayTime(
          bookModel.appointmentModel!.dayName!,
          '${bookModel.appointmentModel!.from!.dateTime!.toDate().hour}'
          ':'
          '${bookModel.appointmentModel!.from!.dateTime!.toDate().minute}');

      bookModel.date = Timestamp.fromDate(nextDayTime);
      bookModel.id = '${nextDayTime.toString()}${bookModel.doctorId}';
      bookModel.status = 1; //pending

      WriteBatch batch = FirebaseFirestore.instance.batch();

      var response = await FirebaseFirestore.instance
          .collection('clinicBooks')
          .doc(bookModel.id)
          .get();
      patientBookModel.id =
          FirebaseFirestore.instance.collection('patientsBooks').doc().id;
      patientBookModel.patientId = _firebaseAuth.currentUser!.uid;
      patientBookModel.bookId = bookModel.id;
      patientBookModel.status = 1; //pending
      if (!response.exists) {
        batch.set(
            FirebaseFirestore.instance
                .collection('clinicBooks')
                .doc(bookModel.id),
            bookModel.toJson());
        batch.set(
            FirebaseFirestore.instance
                .collection('patientsBooks')
                .doc(patientBookModel.id),
            patientBookModel.toJson());
      } else {
        batch.set(
            FirebaseFirestore.instance
                .collection('patientsBooks')
                .doc(patientBookModel.id),
            patientBookModel.toJson());
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
  Future<Either<Failure, void>> deleteBook(
      {required PatientBookModel patientBookModel}) async {
    try {
      patientBookModel.status = 3; //cancelled
      await FirebaseFirestore.instance
          .collection('patientsBooks')
          .doc(patientBookModel.id)
          .set(patientBookModel.toJson());
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  DateTime getNextDayTime(String day, String time) {
    // Create a map of days to integers
    Map<String, int> dayMap = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7
    };

    // Parse the time
    TimeOfDay parsedTime = TimeOfDay(
      hour: int.parse(time.split(':')[0]),
      minute: int.parse(time.split(':')[1]),
    );

    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the next occurrence of the specified day
    int targetDay = dayMap[day]!;
    int daysUntilNextTargetDay = (targetDay - now.weekday + 7) % 7;
    if (daysUntilNextTargetDay == 0 &&
        (now.hour > parsedTime.hour ||
            (now.hour == parsedTime.hour && now.minute >= parsedTime.minute))) {
      daysUntilNextTargetDay = 7;
    }

    // Calculate the next date for the specified day and time
    DateTime nextDayTime = DateTime(
      now.year,
      now.month,
      now.day + daysUntilNextTargetDay,
      parsedTime.hour,
      parsedTime.minute,
    );

    return nextDayTime;
  }
}
