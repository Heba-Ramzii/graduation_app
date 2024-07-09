import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/dio_helper/dio_helper.dart';
import 'package:graduation_app/core/dio_helper/end_points.dart';
import 'package:graduation_app/core/errors/fail.dart';
import 'package:graduation_app/feature/doctor/data/models/ai_model.dart';

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
      debugPrint("***********************ttttttttttttttttrue********************");
      debugPrint(response.result);
      return right(response);
    } catch (e) {
      debugPrint(
          "************************eeeeeeeeeeeeeeerrrrrrrrrror****************");
      debugPrint("in exception : ${e.toString()}");
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

      debugPrint("tttttttttttttttttttrue+++++++++++++++");
      debugPrint(response.length.toString());
      return right(response);
    } catch (e) {
      debugPrint("geeeeeeeeeeeeeeeeetttttttttttttt models errrrrror");
      debugPrint(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
