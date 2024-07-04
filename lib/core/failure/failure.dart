import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String code;
  final String message;

  Failure(this.code, this.message);

  @override
  String toString() => 'Error $code: $message';

  static Failure fromFirebaseError(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return Failure(e.code, 'You do not have permission to perform this action.');
      case 'network-request-failed':
        return Failure(e.code, 'Network error, please try again later.');
      case 'user-not-found':
        return Failure(e.code, 'No user found for the provided credentials.');
      case 'wrong-password':
        return Failure(e.code, 'The password is incorrect.');
      case 'email-already-in-use':
        return Failure(e.code, 'The email address is already in use by another account.');
      case 'invalid-email':
        return Failure(e.code, 'The email address is not valid.');
      case 'user-disabled':
        return Failure(e.code, 'The user account has been disabled by an administrator.');
      case 'too-many-requests':
        return Failure(e.code, 'Too many requests. Please try again later.');
      case 'operation-not-allowed':
        return Failure(e.code, 'This operation is not allowed. Please contact support.');
      case 'weak-password':
        return Failure(e.code, 'The password is too weak.');
      case 'invalid-verification-code':
        return Failure(e.code, 'The verification code is invalid.');
      case 'invalid-verification-id':
        return Failure(e.code, 'The verification ID is invalid.');
      case 'account-exists-with-different-credential':
        return Failure(e.code, 'An account already exists with the same email address but different sign-in credentials.');
      case 'credential-already-in-use':
        return Failure(e.code, 'This credential is already associated with a different user account.');
      case 'invalid-credential':
        return Failure(e.code, 'The credential provided is malformed or has expired.');
    // Add more cases as needed based on Firebase error codes you expect to handle
      default:
        return Failure(e.code, e.message ?? 'An unknown error occurred.');
    }
  }
  static Failure fromException(Exception e) {
    if (e is IOException) {
      return Failure('io_exception', 'An input/output error occurred.');
    } else if (e is FormatException) {
      return Failure('format_exception', 'A data format error occurred.');
    } else if (e is TimeoutException) {
      return Failure('timeout_exception', 'The operation timed out.');
    } else {
      return Failure('unknown_exception', e.toString());
    }
  }
}


