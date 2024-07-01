import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthModel>> getUser({required bool isDoctor}) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection(isDoctor ? 'doctors' : 'patient')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      return right(AuthModel.fromJson(response.data()!));
    } on FirebaseAuthException catch (e) {
      return left(Failure.fromFirebaseError(e));
    } on Exception catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      var loginResponse =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(loginResponse.user!.uid)
          .get();

      return right(AuthModel.fromJson(response.data()!));
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

      AuthModel authModel = AuthModel(
          name: name,
          email: email,
          password: password,
          id: response.user!.uid,
          isDoctor: isDoctor);
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
