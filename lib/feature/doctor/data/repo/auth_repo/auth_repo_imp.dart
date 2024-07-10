import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUser() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      return right(response.data()!);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } catch (e) {
      return left(Failure("400", e.toString()));
    }
  }

  @override
  Future<Either<Failure, DoctorModel>> login(
      {required String email, required String password}) async {
    try {
      var loginResponse =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        return left(Failure(
            "400", "Please Verify Your Email First\nPlease Check Your Email"));
      }

      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(loginResponse.user!.uid)
          .get();

      return right(DoctorModel.fromJson(response.data()!));
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } on Exception catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } on Exception catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signup(
      {required String name,
      required String email,
      required bool isDoctor,
      required String password}) async {
    try {
      var response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      DoctorModel authModel = DoctorModel(
          name: name,
          email: email,
          id: response.user!.uid,
          isDoctor: isDoctor,
          adminVerified: false);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authModel.id)
          .set(authModel.toJson());
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } on Exception catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
