import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_app/core/dio_helper/dio_helper.dart';
import 'package:graduation_app/core/dio_helper/end_points.dart';
import 'package:graduation_app/core/errors/failures.dart';

import 'ai_repo.dart';

class AiRepoImp extends AiRepo {
  @override
  Future<Either<Failure, String>> aiDiagnosis(
      {required File image, required int doctorId}) async {
    try {
      Map<String, dynamic> map = {
        'image': image,
        'doctor_id': doctorId,
      };
      var data = await DioHelper.postDate(url: EndPoints.detection, data: map);
      String result = data.data['result'];
      return right(result);
    } catch (e) {
      print("login error");
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
