import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_app/core/dio_helper/dio_helper.dart';
import 'package:graduation_app/core/dio_helper/end_points.dart';
import 'package:graduation_app/core/errors/failures.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/models/ai_model.dart';

import 'ai_repo.dart';

class AiRepoImp extends AiRepo {
  @override
  Future<Either<Failure, AIModel>> aiDiagnosis(
      {required File image, required int doctorId}) async {
    try {
      Map<String, dynamic> map = {
        'image': await MultipartFile.fromFile(
          image.path,
        ),
        'doctor_id': doctorId,
      };
      var data = await DioHelper.postDate(url: EndPoints.detection, data: map);
      AIModel response = AIModel.fromJson(data.data);
      print("***********************ttttttttttttttttrue********************");
      print(response.result);
      return right(response);
    } catch (e) {
      print(
          "************************eeeeeeeeeeeeeeerrrrrrrrrror****************");
      print("in exception : ${e.toString()}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AIModel>>> get() async {
    try {
      var data = await DioHelper.getDate(
        url: EndPoints.detection,
      );
      List<AIModel> response =
          (data.data as List).map((e) => AIModel.fromJson(e)).toList();

      print("tttttttttttttttttttrue+++++++++++++++");
      print(response.length);
      return right(response);
    } catch (e) {
      print("geeeeeeeeeeeeeeeeetttttttttttttt models errrrrror");
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
