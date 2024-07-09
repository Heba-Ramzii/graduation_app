import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class DataFailure extends Failure {
  DataFailure(super.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Make sure you are connected to the Internet');
      default:
        return ServerFailure('Make sure you are connected to the Internet');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request not found, please try again later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, please try again later!");
    } else {
      return ServerFailure("Ops There was an error, please try again later!");
    }
  }
}
